Return-Path: <linux-gpio+bounces-37594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M5SBaAcF2rw5AcAu9opvQ
	(envelope-from <linux-gpio+bounces-37594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:32:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF445E7CC7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68CE83028089
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389BF3E92BF;
	Wed, 27 May 2026 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGphHJR1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231C3D9666
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899534; cv=none; b=VtsNA2KInbmKVciMBGOFpC7EsB4g++k/dJOaK3njjiWoDWlzqlk3wzJfnZCAYfHSlb4VBoceMDUkc6yTglLNfmARFyyiLuEh3eCYYo/dvELrQ+x/SdnVB3CADmOI6S4CZREnp3zOgrqLm6/LPrXoWewXel7OtvLKbcg22b+y3UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899534; c=relaxed/simple;
	bh=IZNU5enikFosUUD+8KFzVBk4h4q4Snn/zms4hSu3trY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUwTI56HPPwDyZv6riCOpP+UtgEKDAlXAUglbMZpzokwhiz6rGfJgBini20HWuPeIWuqBCAk7jcCDbwDtW63hMx0os+GJ++J+x601ICyeaLHvw70zYnvkFDZuGcPNGdXBmEotZ8FNV74WMyvqYts3bDmsI2mcGV1TPug7IHz6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGphHJR1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DD81F00A3F
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899532;
	bh=M1zzhCjZOtsEXfcviTV2bXM7KM8VdwloR+Jo7p0MZmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fGphHJR15hqLAXNil3f6C2mI7cdP7dQlFE6wvmA+1CMv1gnnM3MdGLUewFOih0Ugn
	 OOQ1nBRC1S+NA0yeUbQnXF8X/ta7Slju+qyk0rkyattZ5EUhTh2EC35OO6i5hRkvX+
	 pYQo6JZqM7+FK392ndumgRTfvwYyH+8oIi1psgqCaE6c4G4bX3PeKGNDheWOXRrDPa
	 rMcPQDF90ym6+EqQXmsslkr+mew2Ocf6o37t4pZG71+1fjDGkaO/N2AXeHyyKoQ2b6
	 4s1ejhT4y8Ad2abnVE5nIIHyC6iPwMSwDbxn8H+Ft0UP1EB28zFhIvdN+Z7ybemBa5
	 FEiSJ9n1FaG3Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa4a688f6eso1063489e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:32:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzqrgtx7iA2si4KbtCYRPryko8r8sHwugVDJXNWrX8yqm/bG237
	ZHYeTNMGiRH4eFiM1HdUyt+foCR64r4/DtZo56bE6cEZ0eHmrvQcugMZ8eIMtxypOnsQXwf7B7t
	MdvBCBQJjjzhYyhNBoafodvOHNn4QoRA=
X-Received: by 2002:ac2:4213:0:b0:5a8:88d5:a502 with SMTP id
 2adb3069b0e04-5aa3238b54bmr5492784e87.39.1779899531348; Wed, 27 May 2026
 09:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525220126.93990-1-rosenp@gmail.com>
In-Reply-To: <20260525220126.93990-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 18:31:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4ccMwsnuegwqopmNkNpWs-UBe8FZUjZr_ibP2GMfuug@mail.gmail.com>
X-Gm-Features: AVHnY4LELlVLdsq-uvMYVt7h458Lgq1OVUsLjfEvHdLcuAgWFO5uTQA3ji-lXFc
Message-ID: <CAD++jLn4ccMwsnuegwqopmNkNpWs-UBe8FZUjZr_ibP2GMfuug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza2: embed pins in the priv struct
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37594-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AAF445E7CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 12:01=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:

> Turn the separately allocated pinctrl_pin_desc array into a flexible
> array member of struct rza2_pinctrl_priv, annotated with
> __counted_by(npins). The pin count is now computed before allocation so
> struct_size() can size the combined object, collapsing two allocations
> into one.
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Overall this looks interesting!

>         struct rza2_pinctrl_priv *priv;
> +       int npins;

unsigned int npins

Fix the variable in the struct too if it's just an int.

>         int ret;
>
> -       priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       npins =3D (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
> +                     RZA2_PINS_PER_PORT;

Uh a double cast, why? Just cast to (unsigned int).

I know this was in the code before, but take this opportunity to fix it.

Yours,
Linus Walleij

