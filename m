Return-Path: <linux-gpio+bounces-38153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFbBNLK0J2p/0wIAu9opvQ
	(envelope-from <linux-gpio+bounces-38153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:37:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0265CD5C
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ultrarisc.com header.s=dkim header.b=NWNe5Wko;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38153-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38153-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ultrarisc.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 175AD307B271
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 06:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D6F378D8C;
	Tue,  9 Jun 2026 06:34:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016445B21A;
	Tue,  9 Jun 2026 06:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986875; cv=none; b=nLWEIO8WInQh1ZYV2EqL90OoAp2eYr9rbDxyTBJbOXrtfCeyjn07zaEcgR8/kf9pim8OcadPLon9sr3jeuSL0SNsgwR+5qJa+oaxzdgWPfU/MGCPqcgut0qzqN1BFRUaTcAubLfj30GKlSnxddiFlMpGhbopALhiYUE0/Z5dQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986875; c=relaxed/simple;
	bh=mN32kZcZe3s/2A/C2HeckScrSCdsoJ7ip9mv7bM0UFg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FhfDUFbdHFjjMMZ0oZITgk2A8rEs4kIqm6gQSippDudUhnqfwHFCKo9zin4n/OMfp4Hp787PFGkh8+yz2rtuNEUkGeNJwBAwW5dJSgb+oGLHPNp1kmO5php/qP8EbPOvyXoI228XvTmpBD0GhpT+OBG21ZNtjaB7wn7Io4tB1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=NWNe5Wko; arc=none smtp.client-ip=218.76.62.146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=AdqnFv/tsFMI2ekiHo9Xhi/ZYvF9ZsyYq
	x0a7TYngz8=; b=NWNe5WkojTXOU69xTUqzkLfK4fcO9+iw571Qp9ePbKv7n+q+F
	/3bYrNhRArx0cIfl1wxYfwu0LB7L/SLeB0eCU1PD+r8ikLL+zZdgMFlxA0oH9jAf
	lXS/uGN3Xe1TiFbImviQd7Z/KPl6k/JZDCxyVOl6cXV5CXZ7kltE1jDRW8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEIVtCdqi6sJAA--.8839S2;
	Tue, 09 Jun 2026 14:35:02 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000
 pinctrl driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAD++jL=LFZYUFyAt9eUMPw02yCXC3cD6h4wvHQ529OS-o-WtSQ@mail.gmail.com>
References: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
 <20260608-ultrarisc-pinctrl-v3-2-30a09ed74275@ultrarisc.com>
 <CAD++jL=LFZYUFyAt9eUMPw02yCXC3cD6h4wvHQ529OS-o-WtSQ@mail.gmail.com>
Date: Tue, 09 Jun 2026 14:34:24 +0800
Message-Id: <178098686461.187087.11502108328443255683.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780986864; l=5128;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=mN32kZcZe3s/2A/C2HeckScrSCdsoJ7ip9mv7bM0UFg=;
 b=uWGowsAoO+tMaswPPgMSw3xoEFhNkl13lzfnxKILbv9igchVJOtfc3BnijLpc6g7S6mHrhFM/
 13l3L2kIYpYAsJbugWIXAZvssPliwfcTrYJ6+RQPf4DxN9M2m2TP/lA
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEEIVtCdqi6sJAA--.8839S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1kXF13XF4xAr43trW7CFg_yoWrZr1fpa
	yrKw15CryUJrWrKa1vq3y8uFyfArs7JrW3Jr1rGFy7XFZxA3sayrWvgr1ruFyDCr95Jr4S
	va15uFyayrn0yFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUonmRUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgA8s6
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:wangjia@ultrarisc.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38153-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ultrarisc.com:dkim,ultrarisc.com:email,ultrarisc.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47A0265CD5C

On 2026-06-09 00:23 +0200, Linus Walleij wrote:
> Hi Jia,
> 
> thanks for your patch!
> 
> On Mon, Jun 8, 2026 at 9:50 AM Jia Wang via B4 Relay
> <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> 
> > From: Jia Wang <wangjia@ultrarisc.com>
> >
> > Add support for the pin controller on the UltraRISC DP1000 SoC.
> >
> > The controller provides mux selection for pins in ports A, B, C, D, and
> > LPC. Ports A-D default to GPIO and support peripheral muxing. LPC pins
> > can be switched to eSPI, but are not available as GPIOs. Basic pin
> > configuration controls such as drive strength, pull-up, and pull-down
> > are also supported.
> >
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> 
> Overall this looks very good, some things to fix up below but nothing
> major!
>

Thanks for the review.
 
> (...)
> > +config PINCTRL_ULTRARISC
> > +       tristate
> > +       depends on OF
> > +       depends on ARCH_ULTRARISC || COMPILE_TEST
> > +       select GENERIC_PINCTRL
> > +       select PINMUX
> > +       select GPIOLIB
> 
> Why GPIOLIB? You don't implement any GPIO chips...
>

Good catch. GPIOLIB is not actually needed here since the driver does not
provide any GPIO functionality. I'll drop the select in the next version.
 
> > +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +       val = readl_relaxed(reg);
> > +       val = (val & ~mask) | field_prep(mask, conf);
> > +       writel_relaxed(val, reg);
> > +       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> 
> Have you thought about using a scoped guard for this lock?
> It will make the code easier to read.
> (Applies everywhere.)
>

Yes, that makes sense. I'll convert the lock sections to use scoped_guard()
throughout the driver in the next version.
 
> > +static int ur_find_group_route(struct ur_pinctrl *pctrl,
> > +                              const char *function,
> > +                              u64 group_mask,
> > +                              const struct ur_func_route **route_out)
> > +{
> > +       const struct ur_func_route *match = NULL;
> > +
> > +       for (u32 i = 0; i < pctrl->data->num_routes; i++) {
> > +               const struct ur_func_route *route = &pctrl->data->routes[i];
> > +
> > +               if (strcmp(route->function, function))
> > +                       continue;
> > +
> > +               if ((route->valid_pins & group_mask) != group_mask)
> > +                       continue;
> > +
> > +               if (match) {
> > +                       dev_err(pctrl->dev,
> > +                               "ambiguous route for function %s group_mask=%#llx\n",
> > +                               function, (unsigned long long)group_mask);
> > +                       return -EINVAL;
> > +               }
> > +
> > +               match = route;
> > +       }
> > +
> > +       if (match) {
> > +               *route_out = match;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> 
> This routing function needs some kind of comment before it explaining
> what is going on and what constraints you are trying to resolve with this.
> 

Agreed. I'll add a comment describing the routing model and the constraints
being resolved here.

> > +static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
> > +                               unsigned int selector)
> 
> Neat that you implement this!
>

Thanks.
 
> > +static const struct pinctrl_ops ur_pinctrl_ops = {
> > +       .get_groups_count = pinctrl_generic_get_group_count,
> > +       .get_group_name = pinctrl_generic_get_group_name,
> > +       .get_group_pins = pinctrl_generic_get_group_pins,
> > +       .dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
> > +       .dt_free_map = pinconf_generic_dt_free_map,
> > +};
> 
> Good use of generic helpers!
> 
> > +static const struct pinmux_ops ur_pinmux_ops = {
> > +       .get_functions_count = pinmux_generic_get_function_count,
> > +       .get_function_name = pinmux_generic_get_function_name,
> > +       .get_function_groups = pinmux_generic_get_function_groups,
> > +       .function_is_gpio = ur_function_is_gpio,
> > +       .set_mux = ur_set_mux,
> > +       .gpio_request_enable = ur_gpio_request_enable,
> > +       .strict = true,
> > +};
> 
> Here too.
> 
> > +static const struct pinconf_ops ur_pinconf_ops = {
> > +       .pin_config_get = ur_pin_config_get,
> > +       .pin_config_set = ur_pin_config_set,
> > +       .pin_config_group_get = ur_pin_config_group_get,
> > +       .pin_config_group_set = ur_pin_config_group_set,
> > +#ifdef CONFIG_GENERIC_PINCONF
> > +       .is_generic = true,
> > +       .pin_config_config_dbg_show = pinconf_generic_dump_config,
> > +#endif
> 
> Why ifdef:ed? Just select it in your Kconfig and rely on it?
> 

GENERIC_PINCONF is already selected via GENERIC_PINCTRL, so the dependency
is guaranteed. The ifdef is therefore unnecessary; I'll remove it in the
next version.

> Yours,
> Linus Walleij
> 

Best regards,
Jia Wang



