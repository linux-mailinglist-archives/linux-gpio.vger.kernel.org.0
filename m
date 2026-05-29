Return-Path: <linux-gpio+bounces-37656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EgPKyMpGWpXrQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:50:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7BE5FD9D4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D29A3149CEC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 05:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593003A1E7E;
	Fri, 29 May 2026 05:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="I/pCpTKR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F257E792;
	Fri, 29 May 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033423; cv=none; b=l2WBOQhPNBlqKKyLpg4bprdDmcbIDmWdvDnZrtzjvwPhBrItSZEtFoobM91m4dxUL9vkTdg6kubHvyPafStP911FC2R2l8ZG8EgSEXrgbwHP8h4ZpJjhkbhd5cAgznUwzmG35jIVIR5aAR1e1XCXYG8Js8Fk90gTgNSlELfIn/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033423; c=relaxed/simple;
	bh=SxjCdFHCCENmLkqPCEujysBRfd568bVtH/3FxfoaW/A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=o0Q8YYKXLOKCLdrGhaQya6S5r+ZC879h5RdGQ988JUxbcwUhCz93qTpTuIi0QrxAiDWc6x/IVXbtY8+9OJz4KtYemyZq8M8AoteFnR1udouhzyRefinUMWqQ1x/2EOmc1I/Aayc4Swyw9UpL8HTl6cNDtYiHMkXp8NbqnlQXQGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=I/pCpTKR; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=R8t6pLKg1TYJMljpG0LujE1NO9A7R1xIe
	xX2vW0OUtM=; b=I/pCpTKRSB+xFjx/Ttr7KqB3gyxRLYcEgzdnYHHIJWWj+Q/mo
	RM4DHWRKNwmltKTw5NqqEa2l7n/6rntVMZObhzu3qUVR+ThYJktHBuvbFe3XuU9h
	Kk3pesEyzJXP5Pgqrx36/rDzW2z674tC91M8irLunO1M93hDIKLJcAorJQ=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUKkJxlqAfYGAA--.8119S2;
	Fri, 29 May 2026 13:44:04 +0800 (CST)
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
To: Conor Dooley <conor@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260528-broiling-naturist-78401ecbb870@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
 <20260525-turbojet-theorize-3a7b49f41af0@spud>
 <177995438556.929162.1470247666821673655.b4-reply@b4>
 <20260528-broiling-naturist-78401ecbb870@spud>
Date: Fri, 29 May 2026 13:43:25 +0800
Message-Id: <178003340524.2187387.10656805779953719738.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780033405; l=5681;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=SxjCdFHCCENmLkqPCEujysBRfd568bVtH/3FxfoaW/A=;
 b=YgD6CblDPtfxQr1la0TpURB+x6fZJggwnhJJfIa/JrOkRFLZ6zFqJ2u6L77kMBxsapzLrAlAN
 jUzkzIfL2OTB5ECnOdrC/k3ycfZrCINZy8Rk+CPxzuEMKuCMvNLVQ4r
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUKkJxlqAfYGAA--.8119S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF43Zr1UAr4rJFWkKF13XFb_yoWrKr47pF
	W8Ga1YkrWUJF4agryjv395uFy3Krs7Jr1YqryUKryUtFn0yr97GF48X3yfuF9YkrZ8Gr1U
	ZayYyFya93s8ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgATsV
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
	TAGGED_FROM(0.00)[bounces-37656-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D7BE5FD9D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-28 09:55 +0100, Conor Dooley wrote:
> On Thu, May 28, 2026 at 03:46:25PM +0800, Jia Wang wrote:
> > On 2026-05-25 11:10 +0100, Conor Dooley wrote:
> > > On Mon, May 25, 2026 at 11:28:51AM +0200, Linus Walleij wrote:
> > > > On Fri, May 15, 2026 at 3:18 AM Jia Wang via B4 Relay
> > > > <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> > > 
> > > > > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > > > > +                               struct device_node *np,
> > > > > +                               const char *propname,
> > > > > +                               struct ur_legacy_prop_data *prop)
> > > > > +static const char *ur_legacy_get_function_name(const struct ur_pinctrl_match_data *match_data,
> > > > > +                                              u32 mode)
> > > > > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 conf,
> > > > > +                                    unsigned long **configs,
> > > > > +                                    unsigned int *num_configs)
> > > > > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > > > > +                                     struct pinctrl_map **map,
> > > > > +                                     unsigned int *reserved_maps,
> > > > > +                                     unsigned int *num_maps,
> > > > > +                                     const struct ur_legacy_prop_data *prop)
> > > > > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > > > +                                   struct device_node *np,
> > > > > +                                   struct pinctrl_map **map,
> > > > > +                                   unsigned int *num_maps)
> > > > 
> > > > What's up with all this legacy stuff?
> > > > 
> > > > What is this a legacy of?
> > > > 
> > > > I thought this was a *new* driver so how can it be "legacy"?
> > > 
> > > Jia already agreed to drop this stuff :)
> > > 
> > > > 
> > > > > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > > > +                                    struct device_node *np_config,
> > > > > +                                    struct pinctrl_map **map,
> > > > > +                                    unsigned int *num_maps)
> > > > > +{
> > > > > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
> > > > > +                                             PIN_MAP_TYPE_INVALID);
> > > > > +}
> > > > 
> > > > Hm I think Conor has new helpers for this so you don't need to wrap
> > > > it like this.
> > > 
> > > Yeah, although "more importantly" the new helpers mean that drivers
> > > shouldn't need to do things like calling these home-rolled functions in
> > > probe, just so that they can try to use pinconf_generic_dt_node_to_map():
> > > | static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
> > > | {
> > > | 	for (u32 i = 0; i < pctldata->match_data->npins; i++) {
> > > | 		int ret;
> > > | 
> > > | 		pctldata->group_names[i] = pctldata->match_data->pins[i].name;
> > > | 		pctldata->group_pins[i] = pctldata->match_data->pins[i].number;
> > > | 
> > > | 		ret = pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->group_names[i],
> > > | 						&pctldata->group_pins[i], 1, NULL);
> > > | 		if (ret < 0)
> > > | 			return dev_err_probe(pctldata->dev, ret,
> > > | 					     "failed to add pin group %s\n",
> > > | 					     pctldata->group_names[i]);
> > > | 	}
> > > | 
> > > | 	return 0;
> > > | }
> > > | 
> > > | static int ur_add_functions(struct ur_pinctrl *pctldata)
> > > | {
> > > | 	for (u32 i = 0; i < pctldata->match_data->num_functions; i++) {
> > > | 		const struct ur_function_desc *desc = &pctldata->match_data->functions[i];
> > > | 		struct pinfunction func = desc->gpio ?
> > > | 			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
> > > | 						 pctldata->match_data->npins) :
> > > | 			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
> > > | 					    pctldata->match_data->npins);
> > > | 		int ret;
> > > | 
> > > | 		ret = pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (void *)desc);
> > > | 		if (ret < 0)
> > > | 			return dev_err_probe(pctldata->dev, ret,
> > > | 					     "failed to add function %s\n",
> > > | 					     desc->name);
> > > | 	}
> > > | 
> > > | 	return 0;
> > > | }
> > > (If I had more time, I would probably go looking to see if there are
> > > more candidates for conversion)
> > > 
> > > Jia, the helper in question is pinctrl_generic_pins_functions_dt_node_to_map().
> > >
> > 
> > I found pinctrl_generic_pins_function_dt_node_to_map() in mainline, but
> > there is no pinctrl_generic_pins_functions_dt_node_to_map() as mentioned.
> > Did you mean the singular version, and is that the one I should use?
> 
> I did, the s was a typo.
>

Thanks for the suggestion. I tried reworking the driver around
pinctrl_generic_pins_function_dt_node_to_map(), but for this driver it
doesn’t appear to be a clear simplification.

The driver relies on a static SoC function table for the hardware mux modes
and valid pin masks, and the current model allows set_mux() to use that data
directly. Switching to the generic DT-driven helper would remove the
probe-time registration, but it would also require extra handling for GPIO
classification and nudge the binding/DTS toward a different representation.

So I would prefer to keep the current model in v2, and I can revisit a
helper-based conversion in a later revision if it still seems beneficial.
 
> Sorry about that,
> Conor.

Best regards,
Jia Wang



