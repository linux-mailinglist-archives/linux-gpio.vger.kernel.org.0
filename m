Return-Path: <linux-gpio+bounces-33265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIawJu3esmncQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:42:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFB274C12
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76C9D305E7D1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3703C9ECA;
	Thu, 12 Mar 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbcfhAkr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78313C140B
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329644; cv=pass; b=L+rsReojTNU6idsNHADcW3AiBnGi6Q0hMFoPrMoLSH0dRIVDMHgIYLAmVmNy3FxHHvMehKFlzxH+4LmQVBZzOUZl+NP/HWe3Un6tPLg4fhcV4gpVliWytNEOv4vQVBcQYl+emu/K9RsW5blgL3/M8E58MEhyoPuRNYN28nSAyJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329644; c=relaxed/simple;
	bh=KsyKo+bsffknCW+m5t5eF8i8EeVtUEF5tsB44WLjUoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWsn2zzF7toVRT7Ecx0CIUK81FnUbJv2/oZ+zSGp5sBuox9YoP3NzkKgzct4rxgcVkyJwfQFNcQDi+NbVIunNmjrz9p4dLtvsdPLLfXVn6KJKD9wZKEqwtelOLh6PvEQg+ZqcDmZJrYy6sUDCmOTB3annEpVmpbd6e4FYK597Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbcfhAkr; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b94a19fdso1148575f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773329641; cv=none;
        d=google.com; s=arc-20240605;
        b=FXfDHgRSpCoPJIq8PPBN3A8JJEd0A10PoEVEqyz5rPTHO4E3RHXWql0XTxJ/GaNQA/
         yGZMsKxVKOn//USXu+tpja8yGRau/4SySlgaSocVPW6/Ui9u1Ete8qIAuBq+shFRicFB
         BoriXx4kHd7GrxiBUcSIT0VlMgJqpYjshUG/6I1Kts9XUyEs3hvLchPUTgSDCoKANDUF
         6by3Jmt+gYaVuAu02HoX+zDSYHNJlmHubVpWvF8W3JnL7EpKbddExbmoZW02zH/JgFFN
         Y0YTZuLJdrgkd1GgwDkxo1uPEj3XTzY0B/oGVi6AzMtvWRAUHleF+YJ14fVKiEdq8Saf
         krwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJIj5/iiczZuhVB8h8Ir9kBxoso1VQddtPwfDCja9rE=;
        fh=SZxZOo+CI4I/kHsnE7ccihoG6bLBTDzzYU4jNJrV0Ns=;
        b=iYrHqy5NCOcjqz1S0BkWqYXvVfPob9PwbL/+wkYvGqtu4d6S4+KQEfOtDqum7myv8C
         MKfOjdnzVOXIaAoNo5J3vbMQFd5AoIEk/1s8qMKZ5YcxUtwQiU9bqN4fwOMYA+UZVKH0
         MYCDUzwcx0Ub483Uq8LOWNnqtOtkis8i0EEFC+xeYQm9a+jRLETNpbrNtQAnKMf165ks
         DGaRiwiIfrV3qQ7jHJ6u8sY9CTwOW743iUfTZs06ADFyq0CghsmaSDKzJ0JnIjzQXmhk
         ARl1zDNz6RoaXZ1Zjo7M80g0H1whyZ4fD5jiHTZzn5LyizWdn1kxcN63z1+CHZ9BIUvO
         N31Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329641; x=1773934441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJIj5/iiczZuhVB8h8Ir9kBxoso1VQddtPwfDCja9rE=;
        b=PbcfhAkrIjrzhYKgNB9bo/vxeZVGfbmJY7Kton07Ph/mmz0Ncox4MLGecXe9hpBl/6
         2VvHMOiceB/k/MHHA/cquy4e1B+udM2pTb5Fo0vE9qi8LYtstCbqa9bFOzmoVLdj/fQK
         0JGJ7iCMrW60/KxOZfmgdB41qgMWJBrimrkqhrKF9VSprszy0IUA7TQuxC2bKci1+6Ax
         Z+NOfJovYLGEv+MWvqQ6tkzSW9pjyY4vwrEtYrKp7vmex7//+k+6bGtV+4OHMx1xNV3u
         IgA31LsfDkJ+e1Lr51ziQ6SO1diC0Mfb6fcfJhWTsOV8ptW63Bj0odd4HF8S55SYf9zs
         1F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329641; x=1773934441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJIj5/iiczZuhVB8h8Ir9kBxoso1VQddtPwfDCja9rE=;
        b=Job1D3V+ZyfQuhnMw4W0nyc1T7XKY9hCpJjowEJNtuU9yj9gQ3mOznDjmX/IgZ7w9H
         x6LrVwKN0bPhzc+XNI+KdcDJr3rGvosIDS61vclM2GncJsg3SA0Ys1WuIxqkEwigyWVW
         Dn2MtcyTWPIZ83qf0v6dYYGG9V3KTEyUV/xVOW9UyNKpYKWd8zxRU9+f8gjeDayuENx8
         NJRDWn++QFxlgEoKUR/z3Oc9YlUm76h6S+LNWGZbsdD+Bek00RZeBQJimty/Z4lIuZS+
         0bkpoOQvyoZm4Abl9Z0a99rTRBFfeyVXDDnuta8uzFy9JjRcrwOOneFCgNPrezxUo21J
         mRtw==
X-Forwarded-Encrypted: i=1; AJvYcCWmfecGIhngHHJ9ptHK46uu688mjYuFOmPoOLD8oJhFvyohtR4NpdOEqvtmqUMydmwA4FnZXOydFK7F@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjdW0/MGUB6DuK+MjU3448VDY/MZYewl98uTHYJLT18EmuM7L
	OmWKagx/QmVoe14c0ROQS821v/Bh/IycpvnwrXxYSLGD7o7pdb0JTXEO5zuk7aMMord/PbYCaOe
	idqqDxLQaquECsmUZdYmXCu9AFqOHm5E=
X-Gm-Gg: ATEYQzzEzEBALCWspuhphTQClUka0hGjfbX3uRmmaCgYMhmFOn3hD3TVEMDnCiRV7eB
	HehRikoI4Dfl9ocA0AVMcxSv9m5lYpu0YGoHcYF3vDkqyS8kDkw5h17LiN22bbdbM1QDbgKzW+a
	bSW6jm/ZXWDODhT3APlwCHP9DCYHdZQXHrU5WQKaBIc+JoDOyT8C/30UmPZAriueuojNj0Wm3KS
	x3p9jxKW1sylrk74Z0etJYWkvX/rY7Ru99iD4XlOBv+ZxROdsl9dOlPsLKaoKSboRJ4AVBYgwkM
	m7IfJViZ9wNfzhttM8k=
X-Received: by 2002:a05:6000:2001:b0:439:b374:c6d8 with SMTP id
 ffacd0b85a97d-43a04dc0df7mr188244f8f.46.1773329640809; Thu, 12 Mar 2026
 08:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312085258.11431-1-clamor95@gmail.com> <20260312085258.11431-3-clamor95@gmail.com>
 <20260312152057.GA3156966-robh@kernel.org>
In-Reply-To: <20260312152057.GA3156966-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 17:33:48 +0200
X-Gm-Features: AaiRm52ThY9ToN1AUcz1wSgudV_rFXLHUlXwRDrBsn_7Gy5q-dftuHNvcbnGNg4
Message-ID: <CAPVz0n2GFgsrqo4_MkvNwd9t=DMU4ZGQzrpNjU+PZ4_Ysx_jcg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33265-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,3c:email]
X-Rspamd-Queue-Id: 9DAFB274C12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:20 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Mar 12, 2026 at 10:52:55AM +0200, Svyatoslav Ryhel wrote:
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
> > index 000000000000..4e5f997317ca
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
>
> Don't these properties apply to the child nodes?
>

They do, but not all properties defined in those schema files are
applicable for this binding. I have marked those which can be applied
in the node patterns.

> > +
> > +patternProperties:
> > +  "^(pin|gpio).":
> > +    type: object
>
>        additionalProperties: false

I will move additionalProperties here then.


>
> Or unevaluatedProperties with the $refs moved here.
>
> > +
> > +    properties:
> > +      pins:
> > +        items:
> > +          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpi=
o7 ]
> > +
> > +      function:
> > +        items:
> > +          enum: [ gpio, lpm-control-in, fps-out, 32k-out1, sd0-dvs-in,=
 sd1-dvs-in,
> > +                  reference-out ]
> > +
> > +      drive-push-pull: true
> > +      drive-open-drain: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +
> > +      maxim,active-fps-source:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: |
> > +          FPS source for the GPIOs to get enabled/disabled when system=
 is in
> > +          active state. Valid values are:
> > +          - MAX77620_FPS_SRC_0: FPS source is FPS0.
> > +          - MAX77620_FPS_SRC_1: FPS source is FPS1
> > +          - MAX77620_FPS_SRC_2: FPS source is FPS2
> > +          - MAX77620_FPS_SRC_NONE: GPIO is not controlled by FPS event=
s and
> > +                                   it gets enabled/disabled by registe=
r access.
> > +          Absence of this property will leave the FPS configuration re=
gister
> > +          for that GPIO to default configuration.
> > +
> > +      maxim,active-fps-power-up-slot:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sequencing event slot number on which the GPIO get enabled w=
hen
> > +          master FPS input event set to HIGH. This is applicable if FP=
S source
> > +          is selected as FPS0, FPS1 or FPS2.
> > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +
> > +      maxim,active-fps-power-down-slot:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sequencing event slot number on which the GPIO get disabled =
when
> > +          master FPS input event set to LOW. This is applicable if FPS=
 source
> > +          is selected as FPS0, FPS1 or FPS2.
> > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +
> > +      maxim,suspend-fps-source:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          This is same as property "maxim,active-fps-source" but value=
 get
> > +          configured when system enters in to suspend state.
> > +
> > +      maxim,suspend-fps-power-up-slot:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          This is same as property "maxim,active-fps-power-up-slot" bu=
t this
> > +          value get configured into FPS configuration register when sy=
stem
> > +          enters into suspend. This is applicable if suspend state FPS=
 source
> > +          is selected as FPS0, FPS1 or FPS2.
> > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +
> > +      maxim,suspend-fps-power-down-slot:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          This is same as property "maxim,active-fps-power-down-slot" =
but this
> > +          value get configured into FPS configuration register when sy=
stem
> > +          enters into suspend. This is applicable if suspend state FPS=
 source
> > +          is selected as FPS0, FPS1 or FPS2.
> > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +
> > +    required:
> > +      - pins
> > +
> > +additionalProperties: false
> > +
> > +# see maxim,max77620.yaml for an example
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620=
.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> > deleted file mode 100644
> > index 28fbca180068..000000000000
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> > +++ /dev/null
> > @@ -1,127 +0,0 @@
> > -Pincontrol driver for MAX77620 Power management IC from Maxim Semicond=
uctor.
> > -
> > -Device has 8 GPIO pins which can be configured as GPIO as well as the
> > -special IO functions.
> > -
> > -Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
> > -for details of the common pinctrl bindings used by client devices,
> > -including the meaning of the phrase "pin configuration node".
> > -
> > -Optional Pinmux properties:
> > ---------------------------
> > -Following properties are required if default setting of pins are requi=
red
> > -at boot.
> > -- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
> > -- pinctrl[0...n]: Properties to contain the phandle for pinctrl states=
 per
> > -             <pinctrl-bindings.txt>.
> > -
> > -The pin configurations are defined as child of the pinctrl states node=
. Each
> > -sub-node have following properties:
> > -
> > -Required properties:
> > -------------------
> > -- pins: List of pins. Valid values of pins properties are:
> > -                   gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gp=
io7.
> > -
> > -Optional properties:
> > --------------------
> > -Following are optional properties defined as pinmux DT binding documen=
t
> > -<pinctrl-bindings.txt>. Absence of properties will leave the configura=
tion
> > -on default.
> > -     function,
> > -     drive-push-pull,
> > -     drive-open-drain,
> > -     bias-pull-up,
> > -     bias-pull-down.
> > -
> > -Valid values for function properties are:
> > -     gpio, lpm-control-in, fps-out, 32k-out, sd0-dvs-in, sd1-dvs-in,
> > -     reference-out
> > -
> > -There are also customised properties for the GPIO1, GPIO2 and GPIO3. T=
hese
> > -customised properties are required to configure FPS configuration para=
meters
> > -of these GPIOs. Please refer <devicetree/bindings/mfd/max77620.txt> fo=
r more
> > -detail of Flexible Power Sequence (FPS).
> > -
> > -- maxim,active-fps-source:           FPS source for the GPIOs to get
> > -                                     enabled/disabled when system is i=
n
> > -                                     active state.  Valid values are:
> > -                                     - MAX77620_FPS_SRC_0,
> > -                                             FPS source is FPS0.
> > -                                     - MAX77620_FPS_SRC_1,
> > -                                             FPS source is FPS1
> > -                                     - MAX77620_FPS_SRC_2 and
> > -                                             FPS source is FPS2
> > -                                     - MAX77620_FPS_SRC_NONE.
> > -                                             GPIO is not controlled
> > -                                             by FPS events and it gets
> > -                                             enabled/disabled by regis=
ter
> > -                                             access.
> > -                                     Absence of this property will lea=
ve
> > -                                     the FPS configuration register fo=
r that
> > -                                     GPIO to default configuration.
> > -
> > -- maxim,active-fps-power-up-slot:    Sequencing event slot number on w=
hich
> > -                                     the GPIO get enabled when
> > -                                     master FPS input event set to HIG=
H.
> > -                                     Valid values are 0 to 7.
> > -                                     This is applicable if FPS source =
is
> > -                                     selected as FPS0, FPS1 or FPS2.
> > -
> > -- maxim,active-fps-power-down-slot:  Sequencing event slot number on w=
hich
> > -                                     the GPIO get disabled when master
> > -                                     FPS input event set to LOW.
> > -                                     Valid values are 0 to 7.
> > -                                     This is applicable if FPS source =
is
> > -                                     selected as FPS0, FPS1 or FPS2.
> > -
> > -- maxim,suspend-fps-source:          This is same as property
> > -                                     "maxim,active-fps-source" but val=
ue
> > -                                     get configured when system enters=
 in
> > -                                     to suspend state.
> > -
> > -- maxim,suspend-fps-power-up-slot:   This is same as property
> > -                                     "maxim,active-fps-power-up-slot" =
but
> > -                                     this value get configured into FP=
S
> > -                                     configuration register when syste=
m
> > -                                     enters into suspend.
> > -                                     This is applicable if suspend sta=
te
> > -                                     FPS source is selected as FPS0, F=
PS1 or
> > -
> > -- maxim,suspend-fps-power-down-slot: This is same as property
> > -                                     "maxim,active-fps-power-down-slot=
" but
> > -                                     this value get configured into FP=
S
> > -                                     configuration register when syste=
m
> > -                                     enters into suspend.
> > -                                     This is applicable if suspend sta=
te
> > -                                     FPS source is selected as FPS0, F=
PS1 or
> > -                                     FPS2.
> > -
> > -Example:
> > ---------
> > -#include <dt-bindings/mfd/max77620.h>
> > -...
> > -max77620@3c {
> > -
> > -     pinctrl-names =3D "default";
> > -     pinctrl-0 =3D <&spmic_default>;
> > -
> > -     spmic_default: pinmux@0 {
> > -             pin_gpio0 {
> > -                     pins =3D "gpio0";
> > -                     function =3D "gpio";
> > -             };
> > -
> > -             pin_gpio1 {
> > -                     pins =3D "gpio1";
> > -                     function =3D "fps-out";
> > -                     maxim,active-fps-source =3D <MAX77620_FPS_SRC_0>;
> > -             };
> > -
> > -             pin_gpio2 {
> > -                     pins =3D "gpio2";
> > -                     function =3D "fps-out";
> > -                     maxim,active-fps-source =3D <MAX77620_FPS_SRC_1>;
> > -             };
> > -     };
> > -};
> > --
> > 2.51.0
> >

