Return-Path: <linux-gpio+bounces-30948-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN5xNUBwcmlpkwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30948-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:45:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3E6CA1C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE486300F283
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E94321D5BC;
	Thu, 22 Jan 2026 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XZsmLjqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B633A9E5;
	Thu, 22 Jan 2026 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106205; cv=none; b=it8ZKsuF4j71yWLGsA4obevJge8hB+At+B0aZbH1D3C9d3Hq05BZeZoj8Jcia2CocmtyVBR4PbDCChQSpVIWhbXxc2slohX2MRGWCaSIUCwXxq1vCOFfXTKU7WFv4sSiwTrJ/nYJ6ZSOkLG6tg0ckBbLdscazD31YfT4J+RPa0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106205; c=relaxed/simple;
	bh=AaCuSNVNlbpISdbj3qDUNtACWdDwCFarITt3mYC8sBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEOGB/3Z66rdF/VfI5PKm9MxsdEFAb+ULD6+DYUdVhoCgLS7DiLFa3Y/QWcbOln3I/lC2Iom4WlI5/AO/3tHhJkaVw3/vZJDVr2G9/b8ex9pq0OyTW67AmrkUPq69Z53mt75gMYIco8DYza3G+BOVvuDgPKllkMV69QxASlf4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XZsmLjqL; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=J+NkPw1KHEz8buXVjem4ZBD0ZcWTYPCfmLMyt2OiDsU=; b=XZsmLjqL4DJALgZfAVC+BwVELt
	ZZIjYPrqWQcsizXgwm7KoqhqAy707t3XU+geNYMaKEHPOuRvjFrMp6DtyI/sQiByzui+rvFulJaKe
	Bp1C3u3AECZkTFiBuZYOllQn5uWxl1g/6wXpUDiU6cPhF3Q8cpLZ7DmqS0xbsWExzKjwkIoWu4JzB
	FQjtqn9YrbrjMlRBxwqzRaA3FG5CzUCIm2ZvDmc/LAEWemZbL82n2OeKTe8kUaCQdtWLoQCHsw5TS
	BVcO2OftmBH77rZb6xQKdFUGC1lWObUCQoy2LiimGfhCaboSwIqPdjgLLJpMEAjO/wLgzVqUxv00J
	ddYdbk2g==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vizKf-003r7u-Ch; Thu, 22 Jan 2026 19:23:01 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, sebastian.reichel@collabora.com,
 Caleb Connolly <kc@postmarketos.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject:
 Re: [linusw-pinctrl:devel 30/31] drivers/pinctrl/pinctrl-rockchip.c:3683
 rockchip_pinconf_set() error: we previously assumed 'gpio->direction_output'
 could be null (see line 3644)
Date: Thu, 22 Jan 2026 19:23:01 +0100
Message-ID: <4087738.KRxA6XjA2N@phil>
In-Reply-To: <202601200057.P0Lr7NDg-lkp@intel.com>
References: <202601200057.P0Lr7NDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30948-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sntech.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,sntech.de:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: C3F3E6CA1C
X-Rspamd-Action: no action

Am Dienstag, 20. Januar 2026, 07:25:00 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Dan Carpenter:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinc=
trl.git devel
> head:   76d415763bae9488dd2b923b1348ce6f26c1f0ae
> commit: e2c58cbe3aff49fe201e81ee5f651294e313ec74 [30/31] pinctrl: rockchi=
p: Simplify locking with scoped_guard()
> config: sh-randconfig-r073-20260119 (https://download.01.org/0day-ci/arch=
ive/20260120/202601200057.P0Lr7NDg-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> smatch version: v0.5.0-8985-g2614ff1a
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601200057.P0Lr7NDg-lkp@intel.com/
>=20
> smatch warnings:
> drivers/pinctrl/pinctrl-rockchip.c:3683 rockchip_pinconf_set() error: we =
previously assumed 'gpio->direction_output' could be null (see line 3644)
>=20
> vim +3683 drivers/pinctrl/pinctrl-rockchip.c
>=20
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3622  static int roc=
kchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> 03b054e9696c3cb Sherman Yin         2013-08-27  3623  				unsigned long *=
configs, unsigned num_configs)
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3624  {
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3625  	struct rockch=
ip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3626  	struct rockch=
ip_pin_bank *bank =3D pin_to_bank(info, pin);
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3627  	struct gpio_chip *=
gpio =3D &bank->gpio_chip;
> 03b054e9696c3cb Sherman Yin         2013-08-27  3628  	enum pin_config_pa=
ram param;
> 58957d2edfa19e9 Mika Westerberg     2017-01-23  3629  	u32 arg;
> 03b054e9696c3cb Sherman Yin         2013-08-27  3630  	int i;
> 03b054e9696c3cb Sherman Yin         2013-08-27  3631  	int rc;
> 03b054e9696c3cb Sherman Yin         2013-08-27  3632 =20
> 03b054e9696c3cb Sherman Yin         2013-08-27  3633  	for (i =3D 0; i < =
num_configs; i++) {
> 03b054e9696c3cb Sherman Yin         2013-08-27  3634  		param =3D pinconf=
_to_config_param(configs[i]);
> 03b054e9696c3cb Sherman Yin         2013-08-27  3635  		arg =3D pinconf_t=
o_config_argument(configs[i]);
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3636 =20
> 203a83112e097a5 Linus Walleij       2025-09-05  3637  		if (param =3D=3D =
PIN_CONFIG_LEVEL || param =3D=3D PIN_CONFIG_INPUT_ENABLE) {
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3638  			/*
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3639  			 * Check for gpi=
o driver not being probed yet.
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3640  			 * The lock make=
s sure that either gpio-probe has completed
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3641  			 * or the gpio d=
river hasn't probed yet.
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3642  			 */
> e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3643  			scoped_guard(mut=
ex, &bank->deferred_lock) {
> 8ce5ef645468502 Caleb Connolly      2022-03-28 @3644  				if (!gpio || !g=
pio->direction_output) {
>                                                                          =
                     ^^^^^^^^^^^^^^^^^^^^^^
> Is this check necessary?

I think the culprit is=20
commit 8ce5ef645468 ("pinctrl/rockchip: support deferring other gpio params=
")

Which moved the original check up here for more generalization, but moved
it out of its original switch block where the break in line 3650 would end
the block, up here where actually a contnue would be necessary?

In its original place, the "break" would exit the switch block and thus
continue to the next entry in the for loop.


> e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3645  					rc =3D rockchi=
p_pinconf_defer_pin(bank,
> e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3646  									pin - bank=
=2D>pin_base,
> e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3647  									param, arg=
);
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3648  					if (rc)
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3649  						return rc;
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3650  					break;

now it looks like this break should be a continue, I think.
Because right now it exits the whole loop, if I'm not blind.


> 8ce5ef645468502 Caleb Connolly      2022-03-28  3651  				}
> e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3652  			}
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3653  		}
> 8ce5ef645468502 Caleb Connolly      2022-03-28  3654 =20
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3655  		switch (para=
m) {
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3656  		case PIN_CON=
=46IG_BIAS_DISABLE:
> 03b054e9696c3cb Sherman Yin         2013-08-27  3657  			rc =3D  rockchip=
_set_pull(bank, pin - bank->pin_base,
> 03b054e9696c3cb Sherman Yin         2013-08-27  3658  				param);
> 03b054e9696c3cb Sherman Yin         2013-08-27  3659  			if (rc)
> 03b054e9696c3cb Sherman Yin         2013-08-27  3660  				return rc;
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3661  			break;
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3662  		case PIN_CON=
=46IG_BIAS_PULL_UP:
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3663  		case PIN_CON=
=46IG_BIAS_PULL_DOWN:
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3664  		case PIN_CON=
=46IG_BIAS_PULL_PIN_DEFAULT:
> 6ca5274d1d1258b Heiko St=C3=BCbner       2013-10-16  3665  		case PIN_CON=
=46IG_BIAS_BUS_HOLD:
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3666  			if (!rockch=
ip_pinconf_pull_valid(info->ctrl, param))
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3667  				return -EN=
OTSUPP;
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3668 =20
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3669  			if (!arg)
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3670  				return -EI=
NVAL;
> 44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3671 =20
> 03b054e9696c3cb Sherman Yin         2013-08-27  3672  			rc =3D rockchip_=
set_pull(bank, pin - bank->pin_base,
> 03b054e9696c3cb Sherman Yin         2013-08-27  3673  				param);
> 03b054e9696c3cb Sherman Yin         2013-08-27  3674  			if (rc)
> 03b054e9696c3cb Sherman Yin         2013-08-27  3675  				return rc;
> d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3676  			break;
> 203a83112e097a5 Linus Walleij       2025-09-05  3677  		case PIN_CONFIG_L=
EVEL:
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3678  			rc =3D rockchip_=
set_mux(bank, pin - bank->pin_base,
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3679  					      RK_FUNC_=
GPIO);
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3680  			if (rc !=3D RK_F=
UNC_GPIO)
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3681  				return -EINVAL;
> 9ce9a02039de72e Jianqun Xu          2021-08-16  3682 =20
> 9ce9a02039de72e Jianqun Xu          2021-08-16 @3683  			rc =3D gpio->dir=
ection_output(gpio, pin - bank->pin_base,
>                                                                          =
    ^^^^^^^^^^^^^^^^^^^^^^
> Unchecked dereference.  This is old code so it's presumably okay.  I
> think this warning is triggering now because of changes in Smatch.

The block from above should already make sure that this is only accessed
if the gpio pointer is valid, so this should okay.


Heiko




