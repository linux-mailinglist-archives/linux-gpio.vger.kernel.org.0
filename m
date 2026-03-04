Return-Path: <linux-gpio+bounces-32506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMn3E+h7qGmHuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 19:37:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0120676E
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 19:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5753331A6098
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 18:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1236351C1F;
	Wed,  4 Mar 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgwiz3fq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B1379972
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648791; cv=none; b=XD96qQz1Pm8ZFZCvsr2XT1F5AHQMbgw1HBhqt6ONvd5fc2TYap36s5GVrRh58jsUuEmGOkO55IaqGmEZ1obn9WS5AX6774zAGk32KI6UKgvDJ5wcLhYguQ2p7K7YYqF15ObD03Br03AoQDcmF++v4bUilLO2Pa0YZsFRlKEjUVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648791; c=relaxed/simple;
	bh=fNKyRO1gPqw6zYWBoPZwENPPeuYaGXp64QH4jS53Xiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOSPp/UrLvZlJhVC0vfXijGreALiwUM7ly+Awne1o+IanTd5yglHrVbCqacrK2Ok2ZuvFw4V8dgXZMhssWK3TNbjGzoNBUGy13FZk8I9VVMsrE7GWTA3jpxKB+HDzbsY549lYSYZhMU9gmUrdevjoW+2seyB5v5UcxXQ4WWkO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgwiz3fq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAE9C2BCB4
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772648791;
	bh=fNKyRO1gPqw6zYWBoPZwENPPeuYaGXp64QH4jS53Xiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sgwiz3fqpE2qESw4427/wkVFOlBeEMsvtO17Cuqy3eZiRse9/VommaFGJmPkp9mXy
	 PqltkmU28CtHrA86jGN1/6lGYZpeIfhXnyI+EiZv30mKnOh6WBm1wWHXNUVzlsz1iC
	 OW8+AQ7A+E0+wjn2XYv6jyc1MdMbBV2NJA1oXJ1ggr1QLtHlWS1s6k7iXEjaBU9dEn
	 e+w5c3B8hTLIwEE8fXnLkMWFkXre/KUIrkCZZ13Und8GXZ9pVlOue/uZRyNdHBpkWj
	 bW7+y4BayCZ1tyl1SUg0Y0Bs9iHva9c8EkZcgxBSGCw1Ms2XMbvBGgvagF6cdT4VFQ
	 88QZNXhL7f85Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b93695f7cdcso901800966b.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 10:26:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWizKDND+uPDp838f+vC49oFjd/e5S/jtUTiVqfUhd2k89fsNBUKc3lFiu2BSwHFjl8Ra4C1tMKOLo@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkSKzMRuNNOTNanFjXHZ/9tIs20y1U+gLHNPl9m/Krc+QTDfB
	h35EHLWHoUtoMAcPHiZ5bO84Q/wOexIM7s56eQC7uMrq3Ro/eEuLK/Kx/4YVgvl1k+JIb9/FAEX
	bqWqOsQ40RYbmItf+k/JRYt6FNbwbVQ==
X-Received: by 2002:a17:907:3f13:b0:b8f:a32d:b90e with SMTP id
 a640c23a62f3a-b93f1386a88mr188119866b.34.1772648789974; Wed, 04 Mar 2026
 10:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de> <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
In-Reply-To: <aacH7NmkOzZued0Y@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Mar 2026 12:26:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
X-Gm-Features: AaiRm50b3Z7cXqKPeUT8jNyjdFvKC1SEvnQlt0VXwEdiHP3kMnXQAyPbfyLH6Y0
Message-ID: <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>, Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AAD0120676E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32506-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,mail.gmail.com:mid,pengutronix.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 10:10=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> Hi Krzysztof and Rob,
>
> On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++=
++
> > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > >  2 files changed, 196 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978=
.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc3=
3978-pinctrl.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' d=
oes not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> >       from schema $id: http://devicetree.org/schemas/mux/mux-controller=
.yaml
> >
>
> Folding the mux node into the parent as suggested [1] causes this error.
> Because the parent now has #mux-control-cells, the generic
> mux-controller.yaml forces the node name to be mux-controller. Since
> this chip is primarily a switch/GPIO controller, naming the parent SPI
> node mux-controller@0 is misleading.
>
> What is the preferred way to go here?

I think there was another series dropping the mux-controller node
name. Not sure what happened to it, but that's what we need to do
here.

Rob

