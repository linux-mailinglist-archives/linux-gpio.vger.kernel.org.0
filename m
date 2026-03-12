Return-Path: <linux-gpio+bounces-33275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLnDKmvqsmnBQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:31:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A99275A12
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E82253045A35
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B24C3F7ABB;
	Thu, 12 Mar 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPxyPH1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0253F7E98
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332837; cv=pass; b=IGS26Cp/SFZVlysX4Vm0pMY3cuCdTj6YI+ZRNEqniWlRilue6YRttNIfmtZdAHuJX/IyRqXUstVWC+Iw5/YDkFU5b19tPBXVGIVZvgvI5ZTwQ1q1TfbHSfcg2oq4ZHuTChAVq3sPluo4Xew1COh9PcGPQcPvS0pzxf9aE4dgL1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332837; c=relaxed/simple;
	bh=uJhH0lI1sVgit2CkGLU8u1v8dwsbJYGM2kBA3mKuxJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhuZoQlqekcCCv93f5/JUIgKdtR22jVoaLnVcQQj8IJfyDwreIwBg7Lcesv8X9qGXHorc+AidxI+iV2WUYHli5lRN2Hkas/IiwmBWEmjTPIENJSGsnagh8w/WwMom1DVUIwL/MX2f5hng9ca3gGFyhSvlaJXD34y1Hu0cHPskQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPxyPH1U; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b78b638eso1368125f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 09:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773332830; cv=none;
        d=google.com; s=arc-20240605;
        b=S69WIJYsvlGBHtcT8NV2zrhapB75fY/nyo3HrpIautLCUjp857RndzDk23I+y37uSa
         wbdVrxsAGr7kOruXjsLq0lm54WTKEybf4QKcomxL23KRUx6Wq0t//mpGtfhI6q+x6AhN
         B9MJsERKO9/GvR5/9K1Tq+yVfsg5WHwg04U14pNvt9fqq60uRE0tMZYZ8TACSyL+LcCh
         u4f99zZkWjYm/59PsOeJyb+flPz/szOPTybRzKS9pdOzJu0OkrgRHr3BI/WX95Zsu82s
         saFwQx3N1TFXcyzgMpOqoZXBOHhucmFNvrS+KgWBTCv+c+2BpLmZGvqDsWZ4SwBDPKbf
         8sQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        fh=sBn4ZJ/oQ2cFRgGhEemJ5h/m/aPSFPa/pfqMsvskImk=;
        b=dU3hUa00USRMUG2My0QWkfg611zKsMU8iJvzODUM4eB/S9U2JItHbl3SXvyMwaWPHB
         uhirX9OeAeyuA/iBcZiG65RqRJOp3x9H9lhG4J6MmspPJ/a4mZ7JJLJ73Tj+sAhhXO4f
         Eo8CpL3eajiHmxTuVJLp1U9eJ/OvvMjS77vAYjyg6cCZ/aL5tGoAZxjFpApoizUvIBw9
         Vn2IyD3aTVuM1kwTgd7rkRAbn9Th8t0UCVKs2wbTvvkPWhCjN5LKMrlf9mGfLmM2g6Fp
         lL999HySJHlmo61yK926XwU0SGBlIDvhmjvgT7xZmLRgVWLgBOJH+7L0wBia6pwx/HBv
         sEEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773332830; x=1773937630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        b=NPxyPH1UQiE56iO1J+Krg8QUq3kWeZN7ewAXlAKDSXLmD9rc8hiJXV6zw0tU7/4eTb
         7K2JV4eNu1HVViAEQvcpPHamtWMW9R/RN8dUfZRT/xFaWFh9ziB0R5y2vk9d81IG3Wql
         edW3lf6vaRoQETYACb7EsiIPOLgLy+DXqMWa/ba0Ly/gq0fFrd4Fe251t/u+qF2R0qAx
         WlxFEbxFqV3HI7hNcrpjKS/KmbHQAInOSmxq7YsBwBCt9UwCRd33E91N2vZYjjCu+I2n
         vM/xSlfa1htcXHU0nvfP4y6p4mEtMIFjElfxdykA5Ty1zJkkklrZKn+EyInyIw2oLdX5
         IGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332830; x=1773937630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        b=V3BCdhc2FDvRsKUpu/sddHKdmpHDsT4I4DSKoyPae1PKAw70OoXjWeeaDwVNjHVYGm
         0KAsLm0YNqc4bGbutp2zYTHSCo7gWt737KMx8y1GZB8RuuheBNY6PKvKpBs+UcvgrMLc
         vR+3inaqAjxG4X7K5hrU7uYQI69XAQFEEuDCs/mG6aFsM+HaPyKZ9X3F9oxePk3bDrld
         dd//mgSxRZS6EJvwDIaBH6m/tYK/joib2wMfRAoHZH6smQIHH8wxuyEgm7xp/3jAGOZa
         0+PHX41gQwKg/fDryhIMM89sw7LPsg8R8Ya0V203vKpu5MWGLPB2sKQWXlOrAydVbChp
         CkIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQvfYuxb1nKdhjchoPt8SP9R70fS6OSjm3TooeHbvVjlpWVHyoU4CSI3Q320YAkntZmm0ymBSx3Qfv@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtO+j9tbS1thh30O+HZCt+jAGJySp0Y/Rc9vQDk+KK4loxVuD
	XsoH2QxCHOBCwgb1ypOjob2cMHEySoCaVmbgpzh7HxQrSGJXE4oCPXJzUkrhbp5FoCeQbtFY4b5
	nNciQO3rUblRhJXRbv5psYurqTlaWNhQ=
X-Gm-Gg: ATEYQzzhB7wTPzIz65M0AeznJWH6iB4YfmYLHaO6AB9IOyoCcv6uBw01FOixUL933pd
	KC24IeyIye9/r8Jci6/eBWl/sxa3jkxusMu4/m6h8z1Mx/tRKfd2jME0XlBzEPWeSRlFCei9a0U
	j1kK8dX1ceID7YZEWxsgPBMkyYSOREhnh0ug5aV5aV/kDDczctg8+8dIKIeC1BjdcAgRn3AUe8S
	4CpxCdAruSVIvOGMafjjxSP0HPzJYJoryGxJyV7IuHTj+/GC90OdIG4yyDFsFoeemFy5hpdDBpg
	+VLmTT1Z
X-Received: by 2002:a5d:5f88:0:b0:439:b671:1d8f with SMTP id
 ffacd0b85a97d-43a04dc0ba5mr539681f8f.45.1773332829453; Thu, 12 Mar 2026
 09:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312085258.11431-1-clamor95@gmail.com> <20260312085258.11431-3-clamor95@gmail.com>
 <20260312152057.GA3156966-robh@kernel.org> <CAPVz0n2GFgsrqo4_MkvNwd9t=DMU4ZGQzrpNjU+PZ4_Ysx_jcg@mail.gmail.com>
 <CAL_JsqKP-uYZf3MLFd5JrrsZ1+pxj-y+te_3uiM9N+5Xu4phUQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKP-uYZf3MLFd5JrrsZ1+pxj-y+te_3uiM9N+5Xu4phUQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 18:26:57 +0200
X-Gm-Features: AaiRm51Esg3lleAiftngJqOtXTsbfFUPZvmyUsPO32KC3v38pJrGNn7u4Fa_N7g
Message-ID: <CAPVz0n0aTEkmb6tFn72f7O=BvJzvkJ6ri+_TmQbnroNrWQppzQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-33275-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A8A99275A12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:39 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Mar 12, 2026 at 10:34=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> > =D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:20 =
Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Mar 12, 2026 at 10:52:55AM +0200, Svyatoslav Ryhel wrote:
> > > > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC =
from
> > > > TXT to YAML format. This patch does not change any functionality; t=
he
> > > > bindings remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> > > >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 --------------=
----
> > > >  2 files changed, 97 insertions(+), 127 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim=
,max77620-pinctrl.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinct=
rl-max77620.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max776=
20-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-=
pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..4e5f997317ca
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinc=
trl.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Pinmux controller function for Maxim MAX77620 Power managem=
ent IC
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  Device has 8 GPIO pins which can be configured as GPIO as well a=
s the
> > > > +  special IO functions.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > >
> > > Don't these properties apply to the child nodes?
> > >
> >
> > They do, but not all properties defined in those schema files are
> > applicable for this binding. I have marked those which can be applied
> > in the node patterns.
>
> Then additionalProperties is appropriate.
>
> > > > +
> > > > +patternProperties:
> > > > +  "^(pin|gpio).":
> > > > +    type: object
> > >
> > >        additionalProperties: false
> >
> > I will move additionalProperties here then.
>
> No, moving it is wrong. You need it here AND in the parent node.
>

Oh, yes, you are right, it seems that I did not notice while
converting from txt. Thanks!

> Rob

