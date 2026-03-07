Return-Path: <linux-gpio+bounces-32726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIDZKYAorGlSmAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:30:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268B22BF7B
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE2DA301E7F1
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 13:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125A26290;
	Sat,  7 Mar 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUFOnMi4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2D7FBAC
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772890236; cv=pass; b=HX9dszRr+xKp8iXNPdEvC2KIGIbzeW7NUhQfEBGVK3Qd2mWtXvvsxKVZLNAWc0Fy/eD3FDJA5yd9GKmSX1tsMqTADQyTJ+S+1/vaA1OmHbDBTP1Pu+ZC7DspRRE/C6JXwt1N3eUaTZm9ME9yolUugfuofpgq/t/s1QCVs5/65Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772890236; c=relaxed/simple;
	bh=G6kNegQKBFYwnygE7hIWLaa6frsBBELEiBKJ771TxG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auYQ2hdMcfzKWM+TcebLipU/aCub0j0EBoxQnOsIxTMX+RsaTqlP5tVcag9cV2u4hcKyw14S24DCFQDq9SOXrsRpfDNuB+APU3Vn5v47RQ1PvZVyHEooVLAr2ywAxJdolhBiSxj+hTsMeHgRJ/BApjyyXecx09xIUYq0lvXVgio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUFOnMi4; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso7358186f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 05:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772890233; cv=none;
        d=google.com; s=arc-20240605;
        b=PEl49eVBpumojFp2t/7jxEbidmHe96PZLUNEEyrZW5ne3RaM/Hy9U8lKO2wjNx+Cix
         beBy9tPC0Gp+boopLRIHgban4p+MnhNC5aWcdMps3o7gDT2t8CtGBwf5+Rno3jAYO2/u
         zoUQITc8F0goQnhyEnv/uR7p4sU2q52mouOji3pRwwjT8ni0uKVC9+GVNNwyQ9orKFHp
         M5s9nGDL8vVjXRhcYQ15/V9m0qvD6rBTLwHcSkW6kDEp76aEmtTsupGBKbNx7Svx+9LP
         RwpLMoPQqup/wkDM7GMuEttcjqvoWH7s+C0D2gJt9tRdxuArVsy70+fBkAVH4A2kpnoX
         raIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9vxg1zKKw5eRGATryRLQmdjvykX+/jqWfKws1Yp5Hqk=;
        fh=xXDoydGOHDbDwGwkUgE0/sfYyDgiiEpG8VBits40xDU=;
        b=iufN9uX0zMbmrQVBQ151cH33YL1nDvdGEP7QPyVTDbyYa4PfjHYjC6pNcd7sb0suta
         1EaBhT8KrK/Fhp76Lw0gEatHvz02VV08oeJX+odWMOkyica9t/OlZgVrOhP1XX2D/nWf
         psEaWTD/vjVm/M9rLS/iDW5Qo8ySA8fQPLSaFVw7BbKkqgRFjBPLUg6B9ZI6QTcLwQRV
         skD097w+1hP4rmDLIrCsMIkdNOzpXZOuo5cvmO0t93kTYb0JrsdrmjIZ8iYqM+08SJ1t
         DdR78jcQ1NrXiVl+67/e7xVS6n2v7VhK9SmeIPNQtWtSyE994iTYShhbpBnZfARuiWvZ
         ySgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772890233; x=1773495033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vxg1zKKw5eRGATryRLQmdjvykX+/jqWfKws1Yp5Hqk=;
        b=bUFOnMi4MPR0wHADjkPGTcwezfzOOsx+6SCp2Za8p3WQjIt5a4Oq+XyPyShsvwGpvX
         DbGdbetRlaLjmlOJotLVmgcG9P91aOyDc9hZ6Z/RwHDEYhnPIv4cf+O05uMMCaIZjPgj
         kbwIwzTNPexvfFvWSbO0U2xfjg/0x8m7/3KT1JofDa2oDCO3LmxSsyFZSnyAEigVijFK
         pvKiA8aUGTRTReF8+pLJ9A5wefMh22YNwtBB/ucjBZDyMbb9tUPnyNmb32qDbAwO8Pvi
         V/tHHd9VpG83ILVzeUg6Bf+CCC3jn/MIu2bWbZpl2qF7MzwiIaWukANBRUY/WhRldufQ
         68JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772890233; x=1773495033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vxg1zKKw5eRGATryRLQmdjvykX+/jqWfKws1Yp5Hqk=;
        b=MYmNI+ySbSX7W7nA+SHQH5VjI/XqFJuOmOH1Fd4Az6BSvSnU8Ud5/4AxS2J3R+jCCZ
         rb+yaKbBt3o0ksF8FyK3EDNmDPMI86DPzLrFiqbmZ9xj5Ji5hxLMYg6RPdMl72Ic42sW
         PVBkPCY8Z9DiEhTxd6GKjZr4icEJJZIPyPn4yKf68cUMY6mYBjBdP5nx/CQ+yPC+hhtS
         bhQPNFncgNv0Z7RtcGU6pite5h+yys4BfNRQgaxWoIsjZ78UcxBUbYlvhtk6IDJ0lOzs
         b8jSeHUJq27NNtG5lqF488MjZrLAdVal00usP0bNvAJqU1WUu5vFRj00YmUaTn68LQtH
         aJuw==
X-Forwarded-Encrypted: i=1; AJvYcCW7iWxl78oy3yt8mpWCoMelB1ap9TwmVcuFeFPLJ5rFpkr+dXaw7H9LuGLkvYXJKmRoAdPz5h92SuXt@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmJUXQmGJPJs90v9auG3jAmkRsSKg5vIrKCFALG0uZqHLjesB
	qY22ogSYxFjvEXKjjR0dDyGxiHFMdl8Qpedtew3HhxCUJww8xVmhSPuVehHKd6aRDnslApeCsm6
	F8pOt5Afr/1RLVd/8l5B1jhvlRTS824A=
X-Gm-Gg: ATEYQzzxZrm3J3C3qxvWQQ8+VUnEhoHY5Hj6vFDaYZ7HQpm6RBIp8sOMlEdxbSLB6y7
	w4c9VDWf4r5/Zm8/Nps4eAWn1AjDFIpBNIB39E9ZL/C7s1tGSTBFcDQFaiVpLvABvZyR4IxNnmw
	qAp/I7bYIL7ts5q8fHDpXIvr9C1+OqX7f5Ha6wuvdCSwBU+yCitFfmPws5bTJZRVqEgLsIpZ1+C
	XSQyxzOOolRz4M03UMhk1zcqHpemcsyoXZnxJcQz/eR68ksYF1TQsG6l//kDOCoS3o+DZBhHNLv
	0JeujvTx
X-Received: by 2002:a5d:5c8a:0:b0:439:be82:1fd9 with SMTP id
 ffacd0b85a97d-439da555622mr9640492f8f.12.1772890232456; Sat, 07 Mar 2026
 05:30:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-3-clamor95@gmail.com>
 <20260307-smiling-coyote-of-economy-317afe@quoll>
In-Reply-To: <20260307-smiling-coyote-of-economy-317afe@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Mar 2026 15:30:21 +0200
X-Gm-Features: AaiRm52hvDWp-hTuU970bgp3X7ZySQtnac9bE5SZT5ZlBfWPeg_o_bRZtEnvaRs
Message-ID: <CAPVz0n2QXSFnrkLPFVDbUjNAkp2_dTumeXh4EsB11ca0jHEC-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2268B22BF7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32726-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url]
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:48 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Mar 06, 2026 at 03:33:47PM +0200, Svyatoslav Ryhel wrote:
> > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
> >  2 files changed, 97 insertions(+), 127 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max=
77620-pinctrl.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-m=
ax77620.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinc=
trl.yaml
> > new file mode 100644
> > index 000000000000..7364a8bdd7d3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.=
yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Pinmux controller function for Maxim MAX77620 Power management =
IC
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  Device has 8 GPIO pins which can be configured as GPIO as well as th=
e
> > +  special IO functions.
> > +
> > +allOf:
> > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +patternProperties:
> > +  "^(pin_gpio|gpio)[0-7_]+$":
>
> Underscores are not allowed in general, so pattern needs fixes. Does
> anything actually rely on this name? Is this ABI? I don't see old
> binding and driver using the name, thus this should be just ^pin-[0-7]$
> (+ is also not correct if you have max 8 gpios)
>

Old txt schema uses pin_gpio[0-7] hence it is here, but greping trees
did not reveal use of pin_gpio so it may be dropped.

No this is not ABI, name may be any. Including gpio0-1-2-3, gpio2-4
etc which is why + is there. or maybe you know better way to cover
those names?

There are device trees which use gpio5_6 with the underscore
(tegra210-smaug.dts; tegra210-p2894.dtsi for example). Should the
schema account for those?

>
> Best regards,
> Krzysztof
>

