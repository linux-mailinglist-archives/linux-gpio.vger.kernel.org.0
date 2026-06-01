Return-Path: <linux-gpio+bounces-37768-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNPSD4bHHWrgdwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37768-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 19:55:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15B6238B5
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 19:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7006430589A2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 17:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBE43E168B;
	Mon,  1 Jun 2026 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr+gO/iR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0E93E120C
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780336403; cv=none; b=nCynPunr7WJkeeLl0d9ujRw3axShQ3rYcUQFql10C2LNyuVi6orwTMehRyWXQlE/dRPu9P4rPUpqhPxpRvJjL3xFKLocZxzgtWdvpJygX5vY5lyVAdbF5xAtg75P3Torgjcd10lr90i+ltdRmbx0sayMVGWLlvFHwKFRNApOESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780336403; c=relaxed/simple;
	bh=V1EbFq5erPeyXncRrSFiwv4PphZGsI2aYofs95Fqt1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUjTSXl3RE3r3FNTd9HVG/1BVC2FVbgAHhvRVVED4CO6YetWTpuLJl0PMWjNr5Bkgbfnni5gWPbL+bpz7P8iUN64ddQgPB242jaFBpSb8xPIvUaoqyfBWc2ggii368CBeP54Sb8Pd3lGq5h6UXueIRjQujUlJn+dWwtXw9k+EbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr+gO/iR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB1A1F0089D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780336400;
	bh=WZ/IhhKarGkjsev1ebvJY6DbVpgdipumlxcq7yohLJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nr+gO/iRezHfQIb24kdU3vqS4vOhiseSZ6xa7VjdriTDL9IbS2aIb/ojqPcIAIVZJ
	 qWxMunqkAm0wsMP6jrIO/7UlDOaNeH7hF27BB4N0afm/wO9bfvems0F28Ck8HW4I+I
	 1VZF0t3infumq2ZX4u/zQHt/PMjvFZ4IZqx4HURNlzc9NZpclnCutWKA5Cokv/j6kG
	 ELynKCEyyuody05IlXgmfcbAQ6oOGK+gk/WUOluQn2EVVq+2EAE+oJyrNgd7hIwZCm
	 jMB+R6lwKZxxHw05OWX4JAKdOMWqYxmirNq7GgfqF9+TPyFy45+DAFZj52CCaauQaz
	 rQpGjHtF9aadw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso1326336e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 10:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jqg+P4th0nW1hgsdj9FyS2PH3Nq+iWwUtt+I3BiIToea8RLsAqQ9F2ZIkQD9gVTcMMyR0uv9uN38M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7j8oPMsLz/OY4q8h7L57GhJhSeUrMD4Ke96amJb4TI8hLmhOo
	ovDJCnSANLPIQopf67GWud1r6DQvJKs0kAXdYu42U9F06stY0WJSxeV6MmOkbweKDRsZ/UrJFTZ
	F9KzXbLgbsyjdtYuYDava5Jnu4n8B5R0=
X-Received: by 2002:a05:6512:3094:b0:5aa:6f47:32a0 with SMTP id
 2adb3069b0e04-5aa6f47362cmr1141285e87.11.1780336399508; Mon, 01 Jun 2026
 10:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 19:53:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
X-Gm-Features: AVHnY4I49xiJB05RGboGIRNa8JpcA6v3sUBoiJTKtDzGmvM3jaAvFsRby97G7MQ
Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37768-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AF15B6238B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

thanks for your patch!

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
(...)
> +          slew-rate:
> +            description: |
> +              Set the slew rate. Valid arguments are described as below:
> +              0: Normal slew rate
> +              1: Slower slew
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Ideally slew-rate is V/s (or V/us, any suitable prefixes).

Of course that would vary for any capacitance on the output line,
so that value would be for an infinite impedance (open circuit).

Do you know that value for the SoC to you can express it like
this and translate it in the driver?

Maybe we should even invent something like
slew-rate-volt-per-microsecond =3D <...>; to push this into
SI units.

That said, there are many SoC:s doing what you're doing
above so it's no strict requirement.

Yours,
Linus Walleij

