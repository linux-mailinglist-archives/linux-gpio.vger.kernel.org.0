Return-Path: <linux-gpio+bounces-37553-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FyYFuedFmq1ngcAu9opvQ
	(envelope-from <linux-gpio+bounces-37553-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:31:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBB5E07BD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A4F3031CF5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F257F3C1F37;
	Wed, 27 May 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="c/epkeuX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59624390998;
	Wed, 27 May 2026 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866946; cv=none; b=qR3/99WkKmM1X2htlaBFcjX8a5chkKsB+bbE8nWO8/gBDgcFPIStFOfRIYi2FArq2HwrK0amZvSoOaBHaQRGrg0rNzC0o987iMHM9M9O80nzqIoe0x8exYnWdKmORV+aR9B2GdkDkpM6tx46WdgU+y+HrJwnaC+SJqfMerD6B20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866946; c=relaxed/simple;
	bh=vcwwQUyK9n27QlQwBaK17jTaA1swwbBF2mQ7+rIB5eo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pBSJ3TqkGdgEAV0TihOUn/RWbQ8FFqF8ZAnFtvEoc99QH5nJl9c6AQmRjdBGAM5JtVI3r55Bluk6f79UgzSZfp696agHusJnyChor9ee1RAIhVwt0jEtdJ+92S5DSzXCo1F0awXaVrs5mAX5RO3q/tmq0mlCxF+SMw6SkRGi4xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=c/epkeuX; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=aTzgD1xNBOFZmHe9UcKPBDuGQHLwp2lyF
	LdiyP2gw48=; b=c/epkeuXoLiWYazhe49qYVy8LTpavjCL4MR44L3Dfo0GA7yFL
	4N0fEWq6njm3gMAfrSKKj9I5h/VWhHsiz1sa5AFeDs2D7PDouNHL9JiTyObYS3qT
	ao7YfkGbi4WiD5hoajwrvucgftk2qUGTNP/QbOuSUQ9tP1rfhX1KLNdOf8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNInRZq+lYGAA--.7935S2;
	Wed, 27 May 2026 15:29:12 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
Date: Wed, 27 May 2026 15:28:33 +0800
Message-Id: <177986691307.2389245.7536116830945296316.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779866913; l=3376;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=vcwwQUyK9n27QlQwBaK17jTaA1swwbBF2mQ7+rIB5eo=;
 b=3s2aR7VhNFkucLVDqg8lLUBYxLlcbU2SHYxTq/poolqPMDfRhsy3KLEMkdqiPufl7/86MvS2n
 u9fuk/K+NjoDLLXyPmoFu6DGxuFxU3XjRNNUBMJNc+EnlhOfHjvM6CQ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkNInRZq+lYGAA--.7935S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF45KF4fXryruF18Wr18uFg_yoW5GFyrpF
	WrKa1ayFW5GF4a9Fyj93yDAFyfGFn7G347try5K3yrtrn5Aas3uFyrWrW5CFn8Cr95Wr1a
	va15ury3uay5JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgABsH
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37553-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ultrarisc.com:email,ultrarisc.com:dkim]
X-Rspamd-Queue-Id: F1EBB5E07BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-25 11:28 +0200, Linus Walleij wrote:
> Hi Jia,
> 
> thanks for your patch!
> 
> On Fri, May 15, 2026 at 3:18 AM Jia Wang via B4 Relay
> <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> 
> > From: Jia Wang <wangjia@ultrarisc.com>
> >
> > Add pinctrl driver for UltraRISC DP1000 pinctrl controller.
> >
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> 
> Please write an elaborate commit message with some details about
> the hardware and it's history etc.
>

Thanks, will expand the commit message with more hardware details in v2.

> (...)
> 
> > +struct ur_legacy_prop_data {
> > +       struct ur_pin_val *pin_vals;
> > +       unsigned int *group_pins;
> > +       unsigned int num_pins;
> > +};
> 
> > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > +                               struct device_node *np,
> > +                               const char *propname,
> > +                               struct ur_legacy_prop_data *prop)
> > +static const char *ur_legacy_get_function_name(const struct ur_pinctrl_match_data *match_data,
> > +                                              u32 mode)
> > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 conf,
> > +                                    unsigned long **configs,
> > +                                    unsigned int *num_configs)
> > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > +                                     struct pinctrl_map **map,
> > +                                     unsigned int *reserved_maps,
> > +                                     unsigned int *num_maps,
> > +                                     const struct ur_legacy_prop_data *prop)
> > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                   struct device_node *np,
> > +                                   struct pinctrl_map **map,
> > +                                   unsigned int *num_maps)
> 
> What's up with all this legacy stuff?
> 
> What is this a legacy of?
> 
> I thought this was a *new* driver so how can it be "legacy"?
> 

The legacy parts will be dropped in v2.

> > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                    struct device_node *np_config,
> > +                                    struct pinctrl_map **map,
> > +                                    unsigned int *num_maps)
> > +{
> > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
> > +                                             PIN_MAP_TYPE_INVALID);
> > +}
> 
> Hm I think Conor has new helpers for this so you don't need to wrap
> it like this.
> 
> > +static void ur_dt_free_map(struct pinctrl_dev *pctldev,
> > +                          struct pinctrl_map *map,
> > +                          unsigned int num_maps)
> > +{
> > +       pinctrl_utils_free_map(pctldev, map, num_maps);
> > +}
> 
> Can't you just assign pinctrl_utils_free_map directly to ur_pinctrl_ops?
> 

Agreed. I've removed both wrappers and switched the driver to use the
generic pinconf DT helpers directly: pinconf_generic_dt_node_to_map_all
for mapping and pinconf_generic_dt_free_map for freeing the maps.

> Yours,
> Linus Walleij
> 

Best regards,
Jia Wang



