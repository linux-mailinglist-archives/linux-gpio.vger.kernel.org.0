Return-Path: <linux-gpio+bounces-13967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E25819F4E3F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9171165C93
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E657A1F668A;
	Tue, 17 Dec 2024 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vY+EuAIX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6F1F6679
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446963; cv=none; b=CIYzaB2DMPce8d0ULRoq9EKnwhgi6mvE/ETjIfDZte2Dk/WQ+oIieLybmBwMjxtzc/dmN8Lemio5G+oRsYvcl+ZptGu7iuVF4wCNP33qpiwdeGW2e/FC8U7orr1T0NUJMto3HvPqQ9NXNDZjvudyTrtrbanycTl7AEq1fvC9xUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446963; c=relaxed/simple;
	bh=0mTjq0sGY8fDojmpvt/A4AZdHo9NvIqP4IpaJ/YA2CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iR7+HkXovvi+WFXdF1npKonsNTHS9K3UwzFXF+FHq2+iEBGikjKC/qvnRYEprIZPjhUc3BjWBQuk+PX4phOCLiDK4P2geeDkeR2i68M3v7uayQijMJsq50It/mF8zJphS3kL1gEyKBN8il1lajQHFcFs0BcjqgmFSdUAGfXsABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vY+EuAIX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5513149e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734446960; x=1735051760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvtWxweQ3MGsbV5nMQDPP1fje5L4gpOHcS36xeevmXg=;
        b=vY+EuAIXetglQJOm6KMn0PYCUvXB4rcyg/KRHnG/wj/trurbNXT/0W/DADkVSXbczk
         N36eEn5UNxoLUzvDLfmj5PCERzUe8XDdHdu1f8+OCSwA3BLeNWW446IFION1RGOqRD8g
         zpp7mQm00eMTshHOHtQmWznhhg3BNfI/iIgsxgh+0T70IIsCyn7GTuKuLJiFro82ZPCo
         yjRb+q5XTY1zH1Y2+g1TBWAfB1prbJ6d7TVhYO2qHRkPIvDUF0gRTcOlB1nU9knnjiCc
         ehHzKVyUXgrsOGjaigK/B8klrOk5mEEeNhzvvIDnazW0kvZ/qcG0A8TksEv6mbw425dz
         Rb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734446960; x=1735051760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvtWxweQ3MGsbV5nMQDPP1fje5L4gpOHcS36xeevmXg=;
        b=ecNg+g4mMbiFStPn929T8F/kOIXVodU1WAyB2xyBp/Iq94+w2qV/4jbs+DGEt55n4C
         WZAgwlhC68KradF3wIXPNPqMvCYPii/aNm5KEMro5C3Gy+XEl31XUaUP06yYUDeiAX1d
         9mdp1oMI4U+uX4LlZTtTT8rJGYHygZqL8TIY1+vdHA0C2THPmKAyYWomky78t6VabB4c
         AZ0eiETrTy2ViPUrNwD8Sr+7u+1h3h373u1cUxG38XD/qb+BlzstfXIokAMOpfXkJosa
         WqPUGIQpLeGRojoTOs+/8Ons7kjpLQBDkmpC52OAn85GsDhJO7WphX8WujlsNG5ixze8
         opmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUccgRc0mt3gL4DqUP+4DdbZuDWNHANMty/fDjzsbTsGmn2FepT46rW5xHDYFLHZAi5QB0fbh0F0pHC@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnrMSOTm4DeB3Ml0U2Rz806mt1S9kwaSR84gMdsU7jzxCbs/b
	98wwmnAlUHWBBYlBfF2Agb+SvzQeWIop33Drv14iKyxvMZmeq7JV08yudBjypb0r0SFFx8rI5X7
	p5Pk2FWTRgrzqCxOZy+Prkj+sUNCRdy1KtOz8Ag==
X-Gm-Gg: ASbGncuNrCQO4ohzeBfSQGcdI/wrhCHGhKO/1gYC79cqdIUxQWdSq8hD0nEBeEr6AX2
	qbeEfagVJpJht+e59VDDqVCOAmuVU7CDWfxg/rg==
X-Google-Smtp-Source: AGHT+IFCOr2SH56W/nF1x51xVb4Q7cHEUFd0kKV7AhhmO/rbd79Tv/8NSoyHsewM64foWz/X0aguqgTEAGC+CtCLOOw=
X-Received: by 2002:a05:6512:3d8a:b0:540:5253:9673 with SMTP id
 2adb3069b0e04-54090555489mr5077299e87.22.1734446959597; Tue, 17 Dec 2024
 06:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com> <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
In-Reply-To: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:49:08 +0100
Message-ID: <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

thanks for your patch!

On Wed, Dec 11, 2024 at 7:48=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
> new Amlogic SoCs, only need to add the corresponding dts file.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

First: are we sure these new SoCs have nothing in common
with sunxi? Because then the sunxi code should be reused.

In any way I recommend:

- Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
  so we keep this sorted by actual vendor, sunxi is apparently
  yours (AMlogic:s) isn't it?

- Also fix MAINTAINERS accordingly.

- Add new driver under drivers/pinctrl/amlogic

- Do not change the Kconfig symbols for sunxi and
  we should be fine.

> +static int aml_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                             struct device_node *np,
> +                             struct pinctrl_map **map,
> +                             unsigned int *num_maps)
> +{
> +       struct aml_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> +       const struct aml_pctl_group *grp;
> +       struct device *dev =3D info->dev;
> +       struct pinctrl_map *new_map;
> +       struct device_node *parent;
> +       int map_num, i;
> +
> +       grp =3D aml_pctl_find_group_by_name(info, np->name);
> +       if (!grp) {
> +               dev_err(dev, "unable to find group for node %pOFn\n", np)=
;
> +               return -EINVAL;
> +       }
> +
> +       if (grp->num_configs)
> +               map_num =3D grp->npins + 1;
> +       else
> +               map_num =3D 1;
> +       new_map =3D devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERN=
EL);
> +       if (!new_map)
> +               return -ENOMEM;
> +
> +       parent =3D of_get_parent(np);
> +       if (!parent) {
> +               devm_kfree(dev, new_map);
> +               return -EINVAL;
> +       }
> +
> +       *map =3D new_map;
> +       *num_maps =3D map_num;
> +       new_map[0].type =3D PIN_MAP_TYPE_MUX_GROUP;
> +       new_map[0].data.mux.function =3D parent->name;
> +       new_map[0].data.mux.group =3D np->name;
> +       of_node_put(parent);
> +
> +       if (grp->num_configs) {
> +               new_map++;
> +               for (i =3D 0; i < grp->npins; i++) {
> +                       new_map[i].type =3D PIN_MAP_TYPE_CONFIGS_PIN;
> +                       new_map[i].data.configs.group_or_pin =3D
> +                               pin_get_name(pctldev, grp->pins[i]);
> +                       new_map[i].data.configs.configs =3D grp->configs;
> +                       new_map[i].data.configs.num_configs =3D grp->num_=
configs;
> +               }
> +       }
> +
> +       dev_info(dev, "maps: function %s group %s num %d\n",
> +                (*map)->data.mux.function, grp->name, map_num);
> +
> +       return 0;
> +}
> +
> +static void aml_dt_free_map(struct pinctrl_dev *pctldev,
> +                           struct pinctrl_map *map, unsigned int num_map=
s)
> +{
> +}
> +
> +static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file =
*s,
> +                            unsigned int offset)
> +{
> +       seq_printf(s, " %s", dev_name(pcdev->dev));
> +}
> +
> +static const struct pinctrl_ops aml_pctrl_ops =3D {
> +       .get_groups_count       =3D aml_get_groups_count,
> +       .get_group_name         =3D aml_get_group_name,
> +       .get_group_pins         =3D aml_get_group_pins,
> +       .dt_node_to_map         =3D aml_dt_node_to_map,
> +       .dt_free_map            =3D aml_dt_free_map,
> +       .pin_dbg_show           =3D aml_pin_dbg_show,
> +};
> +
> +static int aml_pctl_dt_calculate_pin(struct aml_pinctrl *info,
> +                                    unsigned int bank_idx, unsigned int =
offset)
> +{
> +       struct aml_gpio_bank *bank;
> +       int retval =3D -EINVAL;
> +       int i;
> +
> +       for (i =3D 0; i < info->nbanks; i++) {
> +               bank =3D &info->banks[i];
> +               if (bank->bank_idx =3D=3D bank_idx) {
> +                       if (offset < bank->gpio_chip.ngpio)
> +                               retval =3D bank->pin_base + offset;
> +                       break;
> +               }
> +       }
> +       if (retval =3D=3D -EINVAL)
> +               dev_err(info->dev, "pin [bank:%d, offset:%d] is not prese=
nt\n", bank_idx, offset);
> +
> +       return retval;
> +}
> +
> +static int aml_pctl_dt_parse_groups(struct device_node *np,
> +                                   struct aml_pctl_group *grp,
> +                                   struct aml_pinctrl *info, int idx)
> +{
> +       struct device *dev =3D info->dev;
> +       struct aml_pinconf *conf;
> +       struct property *of_pins;
> +       unsigned int bank_idx;
> +       unsigned int offset, npins;
> +       int i =3D 0;
> +       int ret;
> +
> +       of_pins =3D of_find_property(np, "pinmux", NULL);
> +       if (!of_pins) {
> +               dev_info(dev, "Missing pinmux property\n");
> +               return -ENOENT;
> +       }
> +
> +       npins =3D of_pins->length / sizeof(u32);
> +       grp->npins =3D npins;
> +       grp->name =3D np->name;
> +       grp->pins =3D devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KE=
RNEL);
> +       grp->pin_conf =3D devm_kcalloc(dev, npins, sizeof(*grp->pin_conf)=
, GFP_KERNEL);
> +
> +       if (!grp->pins || !grp->pin_conf)
> +               return -ENOMEM;
> +
> +       ret =3D pinconf_generic_parse_dt_config(np, info->pctl, &grp->con=
figs,
> +                                             &grp->num_configs);

But can't you just move this code around? grp->num_configs give the
number of configs, so why do you have to go and look up pinmux
above, can't you just use grp->num_configs instead of of_pins
and npins above?

> +static int aml_pctl_parse_functions(struct device_node *np,
> +                                   struct aml_pinctrl *info, u32 index,
> +                                   int *grp_index)
> +{
> +       struct device *dev =3D info->dev;
> +       struct aml_pmx_func *func;
> +       struct aml_pctl_group *grp;
> +       int ret, i;
> +
> +       func =3D &info->functions[index];
> +       func->name =3D np->name;
> +       func->ngroups =3D of_get_child_count(np);
> +       if (func->ngroups =3D=3D 0)
> +               return dev_err_probe(dev, -EINVAL, "No groups defined\n")=
;
> +
> +       func->groups =3D devm_kcalloc(dev, func->ngroups, sizeof(*func->g=
roups), GFP_KERNEL);
> +       if (!func->groups)
> +               return -ENOMEM;
> +
> +       i =3D 0;
> +       for_each_child_of_node_scoped(np, child) {
> +               func->groups[i] =3D child->name;
> +               grp =3D &info->groups[*grp_index];
> +               *grp_index +=3D 1;
> +               ret =3D aml_pctl_dt_parse_groups(child, grp, info, i++);
> +               if (ret)
> +                       return ret;
> +       }
> +       dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func=
->name, func->ngroups);
> +
> +       return 0;
> +}
> +
> +static u32 aml_bank_pins(struct device_node *np)
> +{
> +       u32 value;
> +
> +       if (of_property_read_u32(np, "npins", &value) < 0)
> +               return 0;
> +       else
> +               return value;
> +}
> +
> +static u32 aml_bank_reg_gpio_offset(struct device_node *np)
> +{
> +       u32 value;
> +
> +       if (of_property_read_u32(np, "reg-gpio-offset", &value) < 0)
> +               return 0;
> +       else
> +               return value;
> +}
> +
> +static u32 aml_bank_reg_mux_offset(struct device_node *np)
> +{
> +       u32 value;
> +
> +       if (of_property_read_u32(np, "reg-mux-offset", &value) < 0)
> +               return 0;
> +       else
> +               return value;
> +}
> +
> +static u32 aml_bank_bit_mux_offset(struct device_node *np)
> +{
> +       u32 value;
> +
> +       if (of_property_read_u32(np, "bit-mux-offset", &value) < 0)
> +               return 0;
> +       else
> +               return value;
> +}
> +
> +static u32 aml_bank_index(struct device_node *np)
> +{
> +       u32 value;
> +
> +       if (of_property_read_u32(np, "bank-index", &value) < 0)
> +               return 0;
> +       else
> +               return value;
> +}

Do we really need helpers for all of this? Can't you just
open code it, at least if it's just used in one place?

> +static unsigned int aml_count_pins(struct device_node *np)
> +{
> +       struct device_node *child;
> +       unsigned int pins =3D 0;
> +
> +       for_each_child_of_node(np, child) {
> +               if (of_property_read_bool(child, "gpio-controller"))
> +                       pins +=3D aml_bank_pins(child);
> +       }
> +
> +       return pins;
> +}
> +
> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
> +                                   struct device_node *np)
> +{
> +       struct device_node *child;
> +
> +       for_each_child_of_node(np, child) {
> +               if (of_property_read_bool(child, "gpio-controller")) {
> +                       info->nbanks++;
> +               } else {
> +                       info->nfunctions++;
> +                       info->ngroups +=3D of_get_child_count(child);
> +               }
> +       }
> +}

This looks like a weird dependency between gpio chips and
pins that I don't quite understand. Some comments and
references to the bindings will be needed so it is clear
what is going on.

> +static struct regmap *aml_map_resource(struct aml_pinctrl *info,
> +                                      struct device_node *node, char *na=
me)
> +{
> +       struct resource res;
> +       void __iomem *base;
> +       int i;
> +
> +       i =3D of_property_match_string(node, "reg-names", name);
> +       if (of_address_to_resource(node, i, &res))
> +               return NULL;
> +
> +       base =3D devm_ioremap_resource(info->dev, &res);
> +       if (IS_ERR(base))
> +               return ERR_CAST(base);

This looks like reimplementation of
devm_platform_ioremap_resource_byname(), can't you just
pass your platform device here?

> +static int aml_pctl_probe_dt(struct platform_device *pdev,
> +                            struct pinctrl_desc *pctl_desc,
> +                            struct aml_pinctrl *info)

Because there is clearly a platform device involved.

I guess I will have more comments as the series progress, but this
is a good starting point!

Yours,
Linus Walleij

