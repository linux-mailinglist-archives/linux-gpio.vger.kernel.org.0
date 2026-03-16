Return-Path: <linux-gpio+bounces-33582-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BF+NwRtuGn5dgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33582-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:50:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 735302A061A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F61302BE3A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 20:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FD8358D14;
	Mon, 16 Mar 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9EY3ga4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F8314A9E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694168; cv=none; b=bRCPjMJnSs3A44d2G9vKdsmz26BUwfrYHqwzBvd1lHNXx13VvYnCF6FbIXKVfFXosdb9pjYZO4f0JtDclKAsohn6U55FZ654uv6WqmAI26wpEH1wF/Mk4dLF62hlM8zXXDBzNim/YTiG5T+AQadPe2pJADlokQqzXKZctGdKv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694168; c=relaxed/simple;
	bh=VZUSzFpH7fKfBRGH53Do1z+WiVQ0GQnMNjCweAfneyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB7HkJFcW/Wyd5A1tTZU2UNd6LxS3sCnKRyzsgeF9DSK5ovDkpI7QJffrIolIumcKLU4k/2AqLef1kmxQGibZS9fgiV0SmexxayljApjmUq+lgCMqz7ZYs2HtS8N+OZEikL0mhTQ2rHtoNYs0qqgD3LfXXJMXeEEyThxhf5sTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9EY3ga4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F5EC2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773694168;
	bh=VZUSzFpH7fKfBRGH53Do1z+WiVQ0GQnMNjCweAfneyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H9EY3ga4LUto5uDWzRTQrsBo2mW6DKDK0cTJaCFAcQZCrpF25PfrOmBk7xVEYpFD6
	 K+e2MZhXRJqgQEKIFHBnyed2trV9JGrSz4JnhSPh2nuuYjt4dMk+ZGBCOVgHqWkrYg
	 vMeBgRQ7DqbtYMkL622Ss0+VtTEF7bM6/C16Rr6j4YwX6CR5LlBH1WGGytiW+AkEsk
	 XUI1bt5+J58mrcHZUCcQuttp0SWj4nMFGF+RAkrDoudYfV4t9DeZM+iPtnLIj2l/Yq
	 YtUB3lBwuGNF78EUE/gfy2RZXp/HMLdjcvXSFUogCXlHmSUIhU1fFK07caiiK8JH2D
	 IoH7RYbvdksjg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79885f4a8ffso41897027b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdd0jNnnNkPFm3+cJ+aqPJ/DPpeWzcRvPHaj1mfdRqOzpzyaXihge8SgQ3Qm8P+QRX9WOQSDmvEHKH@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFjzKTYiLA5yOB5V5wbdy9F5krZDzyEcWFb5PS9q6pm7WXH0O
	AxRHTmBy5hCv0Duf9qKT1GnDbQqUD740Jbgm/17m912rLu135UQEXDJlhZqRrOSkcOBXWOeW+vH
	2PEos/E3F12pcsXP7x1B2fd9yfn9zSqc=
X-Received: by 2002:a05:690c:93:b0:799:1af1:6c52 with SMTP id
 00721157ae682-79a1c1acb77mr150733297b3.40.1773694167554; Mon, 16 Mar 2026
 13:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316140514.1406588-1-o.rempel@pengutronix.de> <20260316140514.1406588-2-o.rempel@pengutronix.de>
In-Reply-To: <20260316140514.1406588-2-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 21:49:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm_afaTuP+9af8HZq+O7+dxfw5tEnP19VABuktZby8buQ@mail.gmail.com>
X-Gm-Features: AaiRm53_qNzFzZsldUXICUMpShw_eWYlVf_nVALoc4j9_4pb00jh-R42NW1p5IQ
Message-ID: <CAD++jLm_afaTuP+9af8HZq+O7+dxfw5tEnP19VABuktZby8buQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33582-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 735302A061A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 3:05=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
>
> The MC33978 and MC34978 differ primarily in their operating temperature
> ranges. While not software-detectable, providing specific compatible
> strings allows the hwmon subsystem to correctly interpret thermal
> thresholds and hardware faults.
>
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
>
> The device interfaces via SPI. While it provides multiple functions, its
> primary hardware purpose is pin/switch control. To accurately represent
> the hardware as a single physical integrated circuit without unnecessary
> DT overhead, all functions are flattened into a single pinctrl node:
> - pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controlle=
r
>   and managing their pin configurations.
> - hwmon: Exposing critical hardware faults (OT, OV, UV) and static
>   voltage/temperature thresholds.
> - mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
>   internal temperature, or battery voltage to an external SoC ADC.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

