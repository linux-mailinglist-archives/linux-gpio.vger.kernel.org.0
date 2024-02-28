Return-Path: <linux-gpio+bounces-3881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D186AF1A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 13:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95CC11F254B1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 12:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F19C6CDC5;
	Wed, 28 Feb 2024 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="Bp2diN7m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A51270CCF
	for <linux-gpio@vger.kernel.org>; Wed, 28 Feb 2024 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709123109; cv=none; b=Zu6LGt9rdLaBmI7CmmnWLiVxOcZtfFCoEFxxhL+zdVZidQo2nhqfsKW38a2NKvX2wMOeqMl1NF44Lvct45Gjh3MEA1W/4op9PslnOacd6l0oaY6ypyGaUE0EVlMjpUqVLMu3uCXkTbdAidj/YnwanPEjfDmGqJP2oP/Q0qv/ryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709123109; c=relaxed/simple;
	bh=72J8DA2wkPf5v/wA4gFTiIZZFZh+voNwLpuKyXmwTl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hvlp1gd3csDLGCWKXQ+jORzXIbQZjkJtx+ucS8LPuIdhD5z1DLGjKbN1Z4IvbuQKeWFSSLfntFuCimVLzKikuLXrp/RsESJQQIqDeVZbpwd236hPoW8YFvpeU8CJkfm19PtLsA72O5qvBpB2umkLGA72ZWCRHff367/u+r9CHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=Bp2diN7m; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HBbTPbN0TH/OXgCpQPF+HkrIrZ5N/wZLenA0+tkrOaU=; b=Bp2diN7m0fPTFuL/fYf26lkHdC
	yICPyCLtE9+mz1wNUw1eDg0ozKGcewypIv+kMT1krXvSdBIssRDsFUKIqguybCKdfAZZcF5ZrDsgM
	s2wj+jgGk6+rot2/QVkUxZUpIeaO4AR4Vza7NGGd6a0v2K1jQQbFQ70odztt+B39rE74=;
X-Preliminary-Spam-Score: -3.2 (---)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rfIg6-004PYh-0M;
	Wed, 28 Feb 2024 13:04:50 +0100
Received: (nullmailer pid 352616 invoked by uid 2001);
	Wed, 28 Feb 2024 12:04:49 -0000
Date: Wed, 28 Feb 2024 13:04:49 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: linux-gpio@vger.kernel.org
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Tony Lindgren <tony@atomide.com>
Subject: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE not
 handled
Message-ID: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Tony Lindgren <tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+5tnwPTtzJF/+WyA"
Content-Disposition: inline
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--+5tnwPTtzJF/+WyA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While figuring out why bias-setting on the beaglebone black did not
work, I noticed what looks like a bug in the pinctrl-single driver,
preventing it from disabling a bias once enabled.

The short version is: It handles pin_config_set by looking up the requested
setting in a DT-defined lookup table, which defines what bits correspond to
each setting. For PIN_CONFIG_BIAS_DISABLE, this never works since that setting
is never defined in the lookup table (so the code that exists to handle this
setting is never actually executed).


For the longer version: The pcs_pinconf_set() function handles setting
various settings, including PIN_CONFIG_BIAS_DISABLE,
PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP.

The relevant bits of code look like this (full code at [1]):

	static int pcs_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin, unsigned long *configs, unsigned num_configs) {
		...
		ret = pcs_get_function(pctldev, pin, &func);
		...
		for (j = 0; j < num_configs; j++) {
			for (i = 0; i < func->nconfs; i++) {
				if (pinconf_to_config_param(configs[j]) != func->conf[i].param)
					continue;

				...
				switch (func->conf[i].param) {
				...
				case PIN_CONFIG_BIAS_DISABLE:
					pcs_pinconf_clear_bias(pctldev, pin);
					break;
				case PIN_CONFIG_BIAS_PULL_DOWN:
				case PIN_CONFIG_BIAS_PULL_UP:
				...
				}
				pcs->write(data, pcs->base + offset);


				break;
			}
			...

Functionally, this requests the table of supported configurations for
the to-be-configured pin using pcs_get_function(). This per-pin (group) table
is populated through setting e.g. pinctrl-single,bias-pullup in the device tree
(see [2]). However, this table never contains entries for
PIN_CONFIG_BIAS_DISABLE (see pcs_parse_pinconf() which populates the table), so
the `if (pinconf_to_config_param(configs[j]) != func->conf[i].param)` line
above is the never true, and the handling for PIN_CONFIG_BIAS_DISABLE never
runs. This is probably because in an earlier version of this code, there
was a separate DT entry for PIN_CONFIG_BIAS_DISABLE, see discussion
links below.

It seems this code has been broken since it was first introduced in
commit 9dddb4df90d1 (pinctrl: single: support generic pinconf).

An obvious fix for this would be to lift the handling for
PIN_CONFIG_BIAS_DISABLE out of the inner loop, running that instead of
the inner loop in that case.


Note that I have not verified my analysis of the code by testing. I did
confirm that if I define the (what I think is) proper DT definitions for
bias control for the beaglebone black board, I can enable bias, but not
disable them, but I cannot rule out that that problem has a different
cause. I also do not have a good toolchain setup for compiling custom
kernels for this setup (and limited time for setting up one), so I do
not expect to be able to provide more testing or a patch anytime soon.


I also wonder about the design in general - currently the DT defines 4 values
for both pullup and pulldown: value, enable, disable, mask. Of these, I think
value is not actually used. Mask is used to clear all relevant bits before
setting a value and enable/disable are bits to set for either state.
PIN_CONFIG_BIAS_DISABLE is implemented by disabling both the pullup and
the pulldown.

This expressivity allows expressing a situation where the pullup and
pulldown can be both enabled at the same time, and a pullup can be
disabled by passing 0 to PIN_CONFIG_BIAS_PULL_UP or using
PIN_CONFIG_BIAS_DISABLE. However, in practice, enabling both is often
not supported by hardware, and even if it is, it makes no sense
electrically. Also, I think that in practice this API is never used as
such, for example gpiolib.c enforces only one of these is set, and
always uses PIN_CONFIG_BIAS_DISABLE to disable a bias. The only docs
I could find about this, was in pinconf-generic.h, which says:

   * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
   *      transition from say pull-up to pull-down implies that you disable
   *      pull-up in the process, this setting disables all biasing.

Suggesting that it is indeed never possible to have pullup and pulldown
enabled at the same time.

For the pinctrl-single driver, it would IMHO make more sense to define
three DT properties, for pullup, pulldown and bias-disabled with a value
and mask each, that can be used when each of these settings is enabled.
If a pullup or pulldown is separately disabled (by calling e.g.
PIN_CONFIG_BIAS_PULL_UP with a zero value), this would just apply the
"bias-disabled" value. This is slightly different from the current
behavior for hardware that has separate pullup/pulldown bits (and no
shared enable bit), but matches the behavior of hardware with a shared
pullup/down enable bit (so callers cannot rely on independent state for
the pullup and pulldown anyway).


Looking at the history of the patch that added this code, it seems an
earlier vdrsion has exactly the implementation that I suggested above
(with a pullup/pulldown/disable attribute with a value and mask, and
additonally also a match value for getting):

https://lore.kernel.org/all/20130121171436.GI15361@atomide.com/T/#ma87c4da5183ca8a10c0d6fe72c9a1fffd206e40e

Then it was changed to the current implementation, seemingly with an
argument that having a "PIN_CONFIG_BIAS_ENABLE" API would be more
consistent than "PIN_CONFIG_BIAS_DISABLE", but then also concluding then
that the enable API is actually redundant if you can also disable pullup
and pulldown separately, and finally settling for
a PIN_CONFIG_BIAS_DISABLE after all (since an existing pinctrl driver
turned out to have it), but without the DT configuration for that.

It could very well be that I'm missing some more complex behavior or API that
needs this, so consider this an open question from a somewhat outsider
perspective, and feel free to ignore it because changing this will need
effort and does not add much except maybe some clarity in code.

[1]: https://github.com/torvalds/linux/blob/45ec2f5f6ed3ec3a79ba1329ad585497cdcbe663/drivers/pinctrl/pinctrl-single.c#L548
[2]: https://www.kernel.org/doc/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt

Gr.

Matthijs

--+5tnwPTtzJF/+WyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmXfIV4ACgkQ6ZMxy91t
JYyS+RAAukAu5WVkhWn9UyGZEDt0SkAfCq1K7HQt6GR+c+U8MRHoNKZoyDlMFZBT
MM73oEnc3LWxsZg+4WHVujs9KbDWWhYSVeUIfP4V9lUA/ecD+IH7hn4rstep0WWG
uxiE6eAo+i+n4ByOgIZTOmkHBNhebXW1/1lskw2IMEXKTLK8G8dBlQfuQVebn1wU
/JmdhjdU9O+1hf9PDGjS+OVftgAz7Uo4GqWmeQXmcAPEEV+EjiCWiGXnj54aAZGV
1vlCppL5jSslvqdieixy1Abbt9JE+rKrVaAH81QNj+agb2cAPnggqcaUHKYcFPSX
bzaUsbzmMgXLCQ7iBhWeE4b6/0/Fz1zTqQHI2KIZoJBAIADQarKVufEgr/YSreXX
jXbnUAf0NmbGUm1dOF7Ci1ux4pB3jBZzg1iAIOrZa99/sgQKjXfeFQB1GlvrIyN9
UxVYmssPl7Cs+NwAyojBCegs1Si3oXxmnkJqOAM5zn2vXAlYaOacRQVHsM6bYtvk
Fr69/JAKgIeDgr2nYvEehbpiEDjiLgIEsizkOM56Su0AssrgpDlCCutYyoKoNoIh
5lNmplPTneZS2CtZb7iGCFc0UW/wQgvX0xRKZb7u0Awnv/b1x9ROJcWcSuskUMs4
CycUhDxHLtm+ZjTfNekiWLh2obe2awGuongkY4A5JK+iAiIlm+g=
=tW7W
-----END PGP SIGNATURE-----

--+5tnwPTtzJF/+WyA--

