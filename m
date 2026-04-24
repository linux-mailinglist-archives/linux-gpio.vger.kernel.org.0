Return-Path: <linux-gpio+bounces-35457-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBjlF1Uf62mRIgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35457-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:44:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B362845ACF3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66C083013A8E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 07:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B211E3368A2;
	Fri, 24 Apr 2026 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzVBZ0em"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E0D30C34A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777016657; cv=none; b=KPpb1iuQ/8UKhrY65sF6cljBMeDKijc0BNWJhmeMccGupfnNUFLLoiGVz/qAKrGYz5SPHQwal6EXH1AEKwpmYgi5bHhuNq4WB9WMX84n2JRZvuJn40C7Nb8Xybx0D9o53Sc0VSKxDDcU+ishrqHytx71jaUjo8+R97KSQM4p0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777016657; c=relaxed/simple;
	bh=5ObiY7L/NEZ2AVzTJWRLxmU4Cg40y2szTcf05CZbkBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKmwWlXSP9MSbboJEEEg/VfGzvaBJY7c8nTT4tpTUaWtGEy4dOF7MXFOKpu5LSF7BvAgONVfv1FJdzxYxTawOYMTE3Sze7rsJyNVviPjli7g1UrplKwYzWlGFm89KE6t7GTPYWDTCqKbCutrHzFY2Zz48v/8LlMjjm9JzU+uYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzVBZ0em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C437C2BCB7
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777016657;
	bh=5ObiY7L/NEZ2AVzTJWRLxmU4Cg40y2szTcf05CZbkBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XzVBZ0emHqYcfGw31lpnCzF0BdOdMSefCvbGjl08UMCG9TeIxzEjs/QybM5efbsCH
	 TsAIXP0XnM/gayvMyDXKONLXjvwb+rPKxn4Akjc/07VMHdFtL+rJKN5utcpjbvutA5
	 oTyS5H3KIN4B7dkVK14WfxwfaSnc8d7V0g/jt/GDjSy9orqxSyN6wau8JpNxFleeyl
	 GHXyxNvJHYyxrtXy9G0rlvB1SRliyxvdFiFT3LOFIClDm3eHD1AhwoGYBG1wM5uAF0
	 rpmjYB8O+goJLsapKNzzlQDd6ISSNQaNVWJUulEBS6un/lWFn+I5Kq5Nt1QQv7yhuE
	 BsmyjzIVdXL1Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so88624311fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:44:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+yPGlOCuh2YtFeCbxOLMRkpeN6STxJrC7UhAmHEQdnd8NN3VViamUfO6TYvLu/uYrf0ZlQ1IZTM3Va@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vaPuxDgMwjUJ/gZ9n8+GVn4GmftuBEHwv7a0IAemLaR4uOHa
	w4yVgth5RqKdzjj2E2djBBeku6rLBQCp572iGmT5d2gGRN4nge9orvmDFMz5RSGG7gGFUGH8TiG
	drPsFZAPmbVpuBkPY8dFpmBYW9vWLXxI=
X-Received: by 2002:a05:6512:1095:b0:5a4:e53:f52c with SMTP id
 2adb3069b0e04-5a417299818mr9911885e87.16.1777016655855; Fri, 24 Apr 2026
 00:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:44:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqD25mudwd0wBCz=-FCzgzssOv5bXTNDdizxdCOY0j=A@mail.gmail.com>
X-Gm-Features: AQROBzCRgiauT9XkDa0yKpB-HNsx8xcHz9gG5I0VdXMGNJPbGVtGHrNlM1aaYHA
Message-ID: <CAD++jLkqD25mudwd0wBCz=-FCzgzssOv5bXTNDdizxdCOY0j=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B362845ACF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35457-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,axiado.com:email]

Hi Petar,

thanks for your patch!

On Tue, Apr 14, 2026 at 3:48=E2=80=AFPM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add support for the Axiado SGPIO controller.
>
> The controller provides a serialized interface for GPIOs with
> configurable direction and interrupt support.
>
> The driver registers the controller as a gpio_chip and uses
> regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

(...)

> +static void ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset=
,
> +                            int value)
> +{
> +       struct ax3000_sgpio *sgpio =3D gpiochip_get_data(chip);
> +       unsigned long flags;
> +       u32 bank =3D (offset / 2) / 32;
> +       u32 position =3D (offset / 2) % 32;

This systematic calculation of offsets from bank and position and the
whole bank concept makes me feel that perhaps the bindings are
better off reflecting the bank structure either by defining several banks
using 2 cells or by using a 3-cell binding?

For 3-cell see:
commit bd3ce71078bde4ecbfc60d49c96d1c55de0635cc
"gpiolib: of: Handle threecell GPIO chips"
for some details on how this can help.

Either of these approaches will further probably help you to
use GPIO_GENERIC (gpio-mmio) helper functions with this hardware,

Yours,
Linus Walleij

