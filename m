Return-Path: <linux-gpio+bounces-6315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A38C2FC3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 08:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B940E284CF5
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 06:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D824D5B0;
	Sat, 11 May 2024 06:07:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97526288
	for <linux-gpio@vger.kernel.org>; Sat, 11 May 2024 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715407620; cv=none; b=GidAlqc/tXQu9qOON+UdCILxgzvnOLYQMdIK/WJdTVrqcPFTuiKtZnv17ML1fuwxCDDQip+larz7hFSBiDsA9en0AjiiHFbl8rIlMytLGlkQ7XWw5oZxlXF6qJ/+Vgf6wfNbragsh+VhTQKDG+7d/4fBZR4Z3xXparr+qywWz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715407620; c=relaxed/simple;
	bh=sbg6rBMGKw1d+kOMGipAdO0cMJaV2maaCccu41bPDPQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/4I9+OCpJxcqVNJd++ZpGllFwbq0bqj8gqQiaHl19pBesKBErGmaPSg2weT/5cUyeZXIRwtCF/WPDiQbDOK519SgMDhE7h8HmU0qX2K1ggUP/niflKybE2qPzYuzXlP+z9wEBLJoMQ0mUTLEwJ7GAw0wgMMOi6QBWW+SR5HXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id ab27d1fa-0f5c-11ef-a9de-005056bdf889;
	Sat, 11 May 2024 09:06:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 11 May 2024 09:06:55 +0300
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <Zj8K_0zpI_IAY66R@surfacebook.localdomain>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-3-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103132852.298964-3-emil.renner.berthing@canonical.com>

Wed, Jan 03, 2024 at 02:28:39PM +0100, Emil Renner Berthing kirjoitti:
> Add pinctrl driver for the T-Head TH1520 RISC-V SoC.

...

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/spinlock.h>

+ types.h

...

> +#define TH1520_PAD(_nr, _name, m0, m1, m2, m3, m4, m5, _flags) \
> +	{ .number = _nr, .name = #_name, .drv_data = (void *)((_flags) | \
> +		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
> +		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }

It's better to read in a form of

#define TH1520_PAD(_nr, _name, m0, m1, m2, m3, m4, m5, _flags)					\
{												\
	.number = _nr,										\
	.name = #_name,										\
	.drv_data = (void *)((_flags) |								\
		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) |	\
		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25))	\
}

...

> +static void th1520_pin_dbg_show(struct pinctrl_dev *pctldev,
> +				struct seq_file *s, unsigned int pin)

static void th1520_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
				unsigned int pin)

(it even satisfies 80 characters limit)

...

> +	nmaps = 0;
> +	for_each_available_child_of_node(np, child) {

You want to use _scoped() variant.

> +		int npins = of_property_count_strings(child, "pins");
> +
> +		if (npins <= 0) {

Better to decouple definition and assignment

		int npins;

		npins = of_property_count_strings(child, "pins");
		if (npins <= 0) {

Besides that, if npins can hold an error code...


> +			of_node_put(child);
> +			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
> +				np, child);

> +			return -EINVAL;

...why is it being shadowed?

> +		}
> +		nmaps += npins;
> +		if (of_property_present(child, "function"))
> +			nmaps += npins;
> +	}

> +	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
> +
> +	nmaps = 0;
> +	mutex_lock(&thp->mutex);
> +	for_each_available_child_of_node(np, child) {

You want to use _scoped() variant.

> +		unsigned int rollback = nmaps;
> +		enum th1520_muxtype muxtype;
> +		struct property *prop;
> +		const char *funcname;
> +		const char **pgnames;
> +		const char *pinname;
> +		int npins;
> +
> +		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
> +		if (ret) {
> +			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
> +				np, child);
> +			goto put_child;
> +		}

> +		if (!of_property_read_string(child, "function", &funcname)) {

Why not traditional pattern, i.e. "errors first"?

		if (of_property_read_string(child, "function", &funcname)) {
			funcname = NULL;
		} else {
			...
		}

> +			muxtype = th1520_muxtype_get(funcname);
> +			if (!muxtype) {
> +				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
> +					np, child, funcname);
> +				ret = -EINVAL;
> +				goto free_configs;
> +			}
> +
> +			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
> +						  np, child);

With help of

	struct device *dev = thp->pctl->dev;

this and other lines in this function become shorter and easier to read.

> +			if (!funcname) {
> +				ret = -ENOMEM;
> +				goto free_configs;
> +			}
> +
> +			npins = of_property_count_strings(child, "pins");
> +			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
> +			if (!pgnames) {
> +				ret = -ENOMEM;
> +				goto free_configs;
> +			}
> +		} else {
> +			funcname = NULL;
> +		}
> +
> +		npins = 0;
> +		of_property_for_each_string(child, "pins", prop, pinname) {
> +			unsigned int i;
> +
> +			for (i = 0; i < thp->desc.npins; i++) {
> +				if (!strcmp(pinname, thp->desc.pins[i].name))
> +					break;
> +			}
> +			if (i == thp->desc.npins) {
> +				nmaps = rollback;
> +				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
> +					np, child, pinname);
> +				goto free_configs;
> +			}
> +
> +			if (nconfigs) {
> +				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
> +				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
> +				map[nmaps].data.configs.configs = configs;
> +				map[nmaps].data.configs.num_configs = nconfigs;
> +				nmaps += 1;

++ ?

> +			}
> +			if (funcname) {
> +				pgnames[npins++] = thp->desc.pins[i].name;
> +				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
> +				map[nmaps].data.mux.function = funcname;
> +				map[nmaps].data.mux.group = thp->desc.pins[i].name;
> +				nmaps += 1;

++ ?

> +			}
> +		}
> +
> +		if (funcname) {
> +			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
> +							  npins, (void *)muxtype);
> +			if (ret < 0) {
> +				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
> +				goto put_child;
> +			}
> +		}
> +	}
> +
> +	*maps = map;
> +	*num_maps = nmaps;
> +	mutex_unlock(&thp->mutex);
> +	return 0;
> +
> +free_configs:
> +	kfree(configs);
> +put_child:
> +	of_node_put(child);
> +	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
> +	mutex_unlock(&thp->mutex);
> +	return ret;
> +}

...

> +	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)

You have a lot of explicit castings here and there, can you reduce the usage
count of them?

> +		return -ENOTSUPP;

...

> +	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)

At least this one can be moved to a helper (macro?).

> +		return -ENOTSUPP;

-- 
With Best Regards,
Andy Shevchenko



