Return-Path: <linux-gpio+bounces-5911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9FC8B45F4
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 13:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFFD61F23FE5
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 11:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF3148CFC;
	Sat, 27 Apr 2024 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FvIWmMiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE444AECE
	for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216868; cv=none; b=fyljeFkmCpZd+IOo52Rl6IR9lrT6hQfO/ZH2OBTWxQP8dQ8paggehxWCSk+kC5xGzA1p55ZQigZFsqPWnGAzO3Wqcho0hLFJ9CbEDL//jb4Vd9P4EL6CXPBLDRD4Gf7VrI5NySyTPEq/LGmDxnlo37LZQ/E3EZiwqpZIqIN3zhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216868; c=relaxed/simple;
	bh=3JUN8Ef0UN+QBAUtDjm4G/guX9OmgDZKtS1+dGOmR3E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnXyZRIiKzMwq78ADaprdarbKcCKrKfoYy5WDqNWxr20GU7VLSggD/p9EtIEp2KYhTKiNYfP4A2YqKNjaYT8yBpu6ohHStJcqgLp6feIV0N61tSAAqJ3HtKPocOj+TxJZOst6d4oLm8ALHFbaPVoc31Enxvk7srgU/NLttyZeTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FvIWmMiS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso3569016a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714216865; x=1714821665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRPW+GikaAPs83DoedFde9bOURsu7XsMsV7lagjHs7E=;
        b=FvIWmMiSW9+C4aLc39D3A8nGIH6rQH3XL2uaBKjpjeTMFGJsvDUGZYMn59b4NxFw9+
         ThWsePp/ITittER0oI0ECgZ6KJQeq5bNh51VCaeGHYAgK9lFMdWE/HdnLghEGsA0og4W
         6KfRKJUmaEUNallWLQ13/sxnqsHun2E1XLs2hKgTfnp2q1YJ52lQqdwq81TSHu/v2+nq
         A+XeEH0V7PsceM2f5KozMaZ5NiQzsBucmkDCv4/J6gfiA338CJ5oew7sFlvlui6dE9lY
         diClqm/paSvbx3BCialfD1g8Caaqx3fsAMDxmeDrsV0iFh8oOLAZtR9ClnRqQWtRW0eb
         i7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714216865; x=1714821665;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRPW+GikaAPs83DoedFde9bOURsu7XsMsV7lagjHs7E=;
        b=JDItyYo5VI5MTvoI5uSs7UR92fWZ1zsQf1StxL9EUBvTcyXV3vHPA2BVucSfqfS0QT
         dicF9TMCnDaTWGXZns2151z2MlHRLgeljozcUf5dCuxDmGq3w+NFzKj4bGruhohTVQbc
         GLk376+VkjCDzluDydfIfu9peZnmVOTHvPgFpXX3+Itu3ruv055zNioudmfTj7oOY6as
         r2OnOdrawFS9J0dXS3fF06nC/AQ8AihoVnxW0usuPoMMz3sW1pAEn1CwMZFMhdrvfvBJ
         +ubdMuCXnem1GuzaN8eJ9n25+C2WIR0ojij38FLGh6jZT7JKOHUE10ECus3VB5XtTjFq
         ogmg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xj9gPxUDMNaQZoKkDEd9PE/4Jh2BslUp+kbQPtDMqfykb7bkU418VmwRVXpdRStrOnpwzn841FvW0lLTJFSZ2LfXTC9VGrgkzA==
X-Gm-Message-State: AOJu0YxeApjgxMWjM7wPvUgsb4WsmbIUcn2uwa8UsLXgIjpNb9dgPGFA
	zIpQKr/aoGxRv0cPjQqF4FIy5HYqPrBBhtADI8i2LzSrvIBC3jWwoj6UomaoBRY=
X-Google-Smtp-Source: AGHT+IF2riIwu/t+oL7gyIiwcDjB2WQ1NvfVhyty6/q7huEYLjYW7wFDCHoweSqHgFZ70bFqTKHI1A==
X-Received: by 2002:a50:8e5e:0:b0:56f:e58f:31f7 with SMTP id 30-20020a508e5e000000b0056fe58f31f7mr3477624edx.28.1714216864903;
        Sat, 27 Apr 2024 04:21:04 -0700 (PDT)
Received: from localhost (host-87-1-234-99.retail.telecomitalia.it. [87.1.234.99])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0057272ff56f3sm89762edb.93.2024.04.27.04.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 04:21:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 27 Apr 2024 13:21:06 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 6/6] mmc: sdhci-brcmstb: Add BCM2712 SD Express support
Message-ID: <ZizfokNsEExVRYaF@apocalypse>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
References: <cover.1713036964.git.andrea.porta@suse.com>
 <a3d82e5a28fe53f1f61621d37d1695b0cd7655d2.1713036964.git.andrea.porta@suse.com>
 <6042c0c7-bb8a-4898-8bed-92155b8e9c4f@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6042c0c7-bb8a-4898-8bed-92155b8e9c4f@broadcom.com>

On 08:55 Sun 14 Apr     , Florian Fainelli wrote:
> 
> 
> On 4/13/2024 3:14 PM, Andrea della Porta wrote:
> > Broadcom BCM2712 SDHCI controller is SD Express capable. Add support
> > for sde capability where the implementation is based on downstream driver,
> > diverging from it in the way that init_sd_express callback is invoked:
> > in downstream the sdhci_ops structure has been augmented with a new
> > function ptr 'init_sd_express' that just propagate the call to the
> > driver specific callback so that the callstack from a structure
> > standpoint is mmc_host_ops -> sdhci_ops. The drawback here is in the
> > added level of indirection (the newly added init_sd_express is
> > redundant) and the sdhci_ops structure declaration has to be changed.
> > To overcome this the presented approach consist in patching the mmc_host_ops
> > init_sd_express callback to point directly to the custom function defined in
> > this driver (see struct brcmstb_match_priv).
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   drivers/mmc/host/Kconfig         |   1 +
> >   drivers/mmc/host/sdhci-brcmstb.c | 147 ++++++++++++++++++++++++++++++-
> >   2 files changed, 147 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > index aebc587f77a7..343ccac1a4e4 100644
> > --- a/drivers/mmc/host/Kconfig
> > +++ b/drivers/mmc/host/Kconfig
> > @@ -1018,6 +1018,7 @@ config MMC_SDHCI_BRCMSTB
> >   	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
> >   	depends on MMC_SDHCI_PLTFM
> >   	select MMC_CQHCI
> > +	select OF_DYNAMIC
> >   	default ARCH_BRCMSTB || BMIPS_GENERIC
> >   	help
> >   	  This selects support for the SDIO/SD/MMC Host Controller on
> > diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> > index 907a4947abe5..56fb34a75ec2 100644
> > --- a/drivers/mmc/host/sdhci-brcmstb.c
> > +++ b/drivers/mmc/host/sdhci-brcmstb.c
> > @@ -29,6 +29,7 @@
> >   #define BRCMSTB_PRIV_FLAGS_HAS_CQE		BIT(0)
> >   #define BRCMSTB_PRIV_FLAGS_GATE_CLOCK		BIT(1)
> > +#define BRCMSTB_PRIV_FLAGS_HAS_SD_EXPRESS	BIT(2)
> >   #define SDHCI_ARASAN_CQE_BASE_ADDR		0x200
> > @@ -50,13 +51,19 @@ struct sdhci_brcmstb_priv {
> >   	unsigned int flags;
> >   	struct clk *base_clk;
> >   	u32 base_freq_hz;
> > +	struct regulator *sde_1v8;
> > +	struct device_node *sde_pcie;
> > +	void *__iomem sde_ioaddr;
> > +	void *__iomem sde_ioaddr2;
> >   	struct pinctrl *pinctrl;
> >   	struct pinctrl_state *pins_default;
> > +	struct pinctrl_state *pins_sdex;
> >   };
> >   struct brcmstb_match_priv {
> >   	void (*hs400es)(struct mmc_host *mmc, struct mmc_ios *ios);
> >   	void (*cfginit)(struct sdhci_host *host);
> > +	int (*init_sd_express)(struct mmc_host *mmc, struct mmc_ios *ios);
> >   	struct sdhci_ops *ops;
> >   	const unsigned int flags;
> >   };
> > @@ -263,6 +270,105 @@ static void sdhci_brcmstb_cfginit_2712(struct sdhci_host *host)
> >   	}
> >   }
> > +static int bcm2712_init_sd_express(struct mmc_host *mmc, struct mmc_ios *ios)
> > +{
> > +	struct sdhci_host *host = mmc_priv(mmc);
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct sdhci_brcmstb_priv *brcmstb_priv = sdhci_pltfm_priv(pltfm_host);
> > +	struct device *dev = host->mmc->parent;
> > +	u32 ctrl_val;
> > +	u32 present_state;
> > +	int ret;
> > +
> > +	if (!brcmstb_priv->sde_ioaddr || !brcmstb_priv->sde_ioaddr2)
> > +		return -EINVAL;
> > +
> > +	if (!brcmstb_priv->pinctrl)
> > +		return -EINVAL;
> > +
> > +	/* Turn off the SD clock first */
> > +	sdhci_set_clock(host, 0);
> > +
> > +	/* Disable SD DAT0-3 pulls */
> > +	pinctrl_select_state(brcmstb_priv->pinctrl, brcmstb_priv->pins_sdex);
> > +
> > +	ctrl_val = readl(brcmstb_priv->sde_ioaddr);
> > +	dev_dbg(dev, "ctrl_val 1 %08x\n", ctrl_val);
> > +
> > +	/* Tri-state the SD pins */
> > +	ctrl_val |= 0x1ff8;
> 
> No magic values please.

Ack.

> 
> > +	writel(ctrl_val, brcmstb_priv->sde_ioaddr);
> > +	dev_dbg(dev, "ctrl_val 1->%08x (%08x)\n", ctrl_val, readl(brcmstb_priv->sde_ioaddr));
> > +	/* Let voltages settle */
> > +	udelay(100);
> 
> Why not usleep_range()?

No real reason. I assume only the lower boundary is critical so I can use usleep_range instead.
Will be fixed in a future patch, the SD express support will be drpped in V2 since nto strictly
necessary.

> 
> > +
> > +	/* Enable the PCIe sideband pins */
> > +	ctrl_val &= ~0x6000;
> 
> No magic values please.
> 
> > +	writel(ctrl_val, brcmstb_priv->sde_ioaddr);
> > +	dev_dbg(dev, "ctrl_val 1->%08x (%08x)\n", ctrl_val, readl(brcmstb_priv->sde_ioaddr));
> > +	/* Let voltages settle */
> > +	udelay(100);
> 
> Likewise.

Ditto.

> 
> > +
> > +	/* Turn on the 1v8 VDD2 regulator */
> > +	ret = regulator_enable(brcmstb_priv->sde_1v8);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Wait for Tpvcrl */
> > +	msleep(1);
> > +
> > +	/* Sample DAT2 (CLKREQ#) - if low, card is in PCIe mode */
> > +	present_state = sdhci_readl(host, SDHCI_PRESENT_STATE);
> > +	present_state = (present_state & SDHCI_DATA_LVL_MASK) >> SDHCI_DATA_LVL_SHIFT;
> > +	dev_dbg(dev, "state = 0x%08x\n", present_state);
> > +
> > +	if (present_state & BIT(2)) {
> 
> Likewise, replace with constant.

Ack.

> 
> > +		dev_err(dev, "DAT2 still high, abandoning SDex switch\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	/* Turn on the LCPLL PTEST mux */
> > +	ctrl_val = readl(brcmstb_priv->sde_ioaddr2 + 20); // misc5
> > +	ctrl_val &= ~(0x7 << 7);
> > +	ctrl_val |= 3 << 7;
> > +	writel(ctrl_val, brcmstb_priv->sde_ioaddr2 + 20);
> > +	dev_dbg(dev, "misc 5->%08x (%08x)\n", ctrl_val, readl(brcmstb_priv->sde_ioaddr2 + 20));
> > +
> > +	/* PTEST diff driver enable */
> > +	ctrl_val = readl(brcmstb_priv->sde_ioaddr2);
> > +	ctrl_val |= BIT(21);
> > +	writel(ctrl_val, brcmstb_priv->sde_ioaddr2);
> > +
> > +	dev_dbg(dev, "misc 0->%08x (%08x)\n", ctrl_val, readl(brcmstb_priv->sde_ioaddr2));
> > +
> > +	/* Wait for more than the minimum Tpvpgl time */
> > +	msleep(100);
> > +
> > +	if (brcmstb_priv->sde_pcie) {
> > +		struct of_changeset changeset;
> > +		static struct property okay_property = {
> > +			.name = "status",
> > +			.value = "okay",
> > +			.length = 5,
> > +		};
> > +
> > +		/* Enable the pcie controller */
> > +		of_changeset_init(&changeset);
> > +		ret = of_changeset_update_property(&changeset,
> > +						   brcmstb_priv->sde_pcie,
> > +						   &okay_property);
> > +		if (ret) {
> > +			dev_err(dev, "%s: failed to update property - %d\n", __func__,
> > +			       ret);
> > +			return -ENODEV;
> > +		}
> > +		ret = of_changeset_apply(&changeset);
> > +	}
> 
> Why are you doing this? Cannot the firmware enable/disable the node
> according to the boot mode or something else?
> 
> This is not going to fly for upstream, sorry.
> -- 
> Florian



