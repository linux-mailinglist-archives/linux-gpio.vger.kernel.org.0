Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B6F45A692
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 16:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbhKWPis convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 23 Nov 2021 10:38:48 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:37568 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbhKWPis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 10:38:48 -0500
Received: by mail-ua1-f51.google.com with SMTP id o1so44588503uap.4;
        Tue, 23 Nov 2021 07:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RtLazKKZz4l59NH7QBwPp4VOuBCQpbno5co0ySkVMok=;
        b=WRodkepU2YiHPSTXCKfbIqn4QhalYo+K9LrDn+6DsX2f6bTbHgxiHju4aIbXeOfXDa
         NbH+hv/S6FKzUkzPG72wgxtBVbYNzgf87ffiCf6d3C36orFAZTJvAwYcVpn4emmnw0XG
         o0/9eFe38BdHCkv2+lxWKQ7bUv6/xCpGhQi57kjOs14SNw0CkmsrgJQzp24KGyy67qJc
         4MqTosSJrAYQpooR7PBem0fjvTkYf68jPRgeIgCCX7qBLXIT7GeBM2kyfS2w9CbW5aPX
         7YkizVBR2F/SZJKHTGTE/xa2/mYs7p5ntVoQVG4vDisTlcg63p4hytgJSNFgJnLoygab
         grNQ==
X-Gm-Message-State: AOAM532znF1KYIWXMGSMPy9gFqhnOXd50e3BMmXzs3AYcD/uMVcMiqfW
        nYqCcXEblfCDp1Uu4F4+e1151UPeHvqjDg==
X-Google-Smtp-Source: ABdhPJzkgaxBsL5cJoj1qN4MdZV/IvVh7Mxg8+AamM9OCrgKxomWTMShyQtWNZnHzua14lI9zY63Zw==
X-Received: by 2002:a67:2fd0:: with SMTP id v199mr10674029vsv.35.1637681737864;
        Tue, 23 Nov 2021 07:35:37 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id z188sm6480877vsz.12.2021.11.23.07.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 07:35:37 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id n6so44625108uak.1;
        Tue, 23 Nov 2021 07:35:36 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr9646514vsl.35.1637681736563;
 Tue, 23 Nov 2021 07:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20211118145558.32359-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211118145558.32359-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 16:35:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFg5p5DF04KxVnHuZyrKW8dKsDS3HjaYHuKK8nnTKoPA@mail.gmail.com>
Message-ID: <CAMuHMdVFg5p5DF04KxVnHuZyrKW8dKsDS3HjaYHuKK8nnTKoPA@mail.gmail.com>
Subject: Re: [RFC] pinctrl: renesas: rzg2l: Add support to select MII/RGMII mode
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

CC Sergey

On Thu, Nov 18, 2021 at 3:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L supports Ether MII/RGMII mode control which select
> the direction of the pins based on PHY mode.
>
> This patch adds support to select MII/RGMII mode based on
> the phy-mode property present in the ether node, as the
> register for configuring the same is located in pinctrl block
> rather than GbEthernet block.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

I can't really say I'm very enthusiastic about this. Looking up
Ethernet nodes like this is fragile, and doesn't work with dynamic
DT overlays (which are not supported upstream anyway, doh).
I think it would be better to configure this explicitly in DT,
especially since in RGMII mode, the user is supposed to configure
the TX_COL, TX_CRS, and RX_ERR in some specific way, too.

Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml does
not define anything like this, but perhaps we can do something
direction-based?
The documentation for the related bits in the ETHER_MODE register says:

    B'0 = RGMII: The Direction of the IO buffer is Output.
    B’1 = MII(Initial value): The Direction of the IO buffer is Input.

Below a few general coding comments (which hopefully become
irrelevant soon...).

> ---
> Current names on HW manual is based on pins which is going to
> change in next version like below.
>
> P20_0->ETH0_mode
> P29_0->ETH1_mode
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 70 +++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index ccee9c9e2e22..bc86119be01e 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -92,6 +92,7 @@
>  #define PWPR                   (0x3014)
>  #define SD_CH(n)               (0x3000 + (n) * 4)
>  #define QSPI                   (0x3008)
> +#define ETHER_MODE             (0x3018)
>
>  #define PVDD_1800              1       /* I/O domain voltage <= 1.8V */
>  #define PVDD_3300              0       /* I/O domain voltage >= 3.3V */
> @@ -104,6 +105,10 @@
>  #define PFC_MASK               0x07
>  #define IEN_MASK               0x01
>  #define IOLH_MASK              0x03
> +#define ETHER_MODE_ETH0_MASK   BIT(0)
> +#define ETHER_MODE_ETH1_MASK   BIT(1)
> +#define ETHER_MODE_ETH0_ADDR   0x11c20000
> +#define ETHER_MODE_ETH1_ADDR   0x11c30000
>
>  #define PM_INPUT               0x1
>  #define PM_OUTPUT              0x2
> @@ -1197,6 +1202,69 @@ static void rzg2l_pinctrl_clk_disable(void *data)
>         clk_disable_unprepare(data);
>  }
>
> +static bool rzg2l_pinctrl_is_rgmii_mode(struct rzg2l_pinctrl *pctrl,
> +                                       struct device_node *node)
> +{
> +       const char *mode = of_get_property(node, "phy-mode", NULL);
> +       bool ret = false;
> +
> +       if (!mode) {
> +               dev_err(pctrl->dev, "phy-mode missing, setting to mii mode");
> +               return ret;
> +       }
> +
> +       if ((!strcmp("rgmii", mode)) || (!strcmp("rgmii-id", mode)) ||
> +           (!strcmp("rgmii-rxid", mode)) || (!strcmp("rgmii-txid", mode)))

return !strncmp(mode, "rgmii", strlen("rgmii"));?

> +               ret = true;
> +
> +       return ret;
> +}
> +
> +static void rzg2l_pinctrl_set_eth_mode(struct rzg2l_pinctrl *pctrl,
> +                                      struct device_node *np)
> +{
> +       u8 reg = readb(pctrl->base + ETHER_MODE);
> +       u8 mask = ETHER_MODE_ETH0_MASK;
> +       const __be32 *prop;
> +       u64 addr;
> +
> +       prop = of_get_property(np, "reg", NULL);
> +       if (!prop)
> +               return;
> +
> +       addr = of_read_number(prop, of_n_addr_cells(np));

of_address_to_resource()

> +       if (addr == ETHER_MODE_ETH1_ADDR)
> +               mask = ETHER_MODE_ETH1_MASK;
> +
> +       if (rzg2l_pinctrl_is_rgmii_mode(pctrl, np))
> +               reg &= ~mask;
> +       else
> +               reg |= mask;
> +
> +       writeb(reg, pctrl->base + ETHER_MODE);
> +}
> +
> +static void rzg2l_pinctrl_set_ether_modes(struct rzg2l_pinctrl *pctrl)
> +{
> +       struct device_node *np, *np1 = NULL;
> +
> +       np = of_find_compatible_node(NULL, NULL, "renesas,rzg2l-gbeth");
> +       if (np) {
> +               np1 = of_find_compatible_node(np, NULL, "renesas,rzg2l-gbeth");
> +               if (of_device_is_available(np))
> +                       rzg2l_pinctrl_set_eth_mode(pctrl, np);
> +
> +               of_node_put(np);
> +       }
> +
> +       if (np1) {
> +               if (of_device_is_available(np1))
> +                       rzg2l_pinctrl_set_eth_mode(pctrl, np1);
> +
> +               of_node_put(np1);
> +       }

for_each_compatible_node(...) { ... }

> +}
> +
>  static int rzg2l_pinctrl_probe(struct platform_device *pdev)
>  {
>         struct rzg2l_pinctrl *pctrl;
> @@ -1246,6 +1314,8 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       rzg2l_pinctrl_set_ether_modes(pctrl);
> +
>         dev_info(pctrl->dev, "%s support registered\n", DRV_NAME);
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
