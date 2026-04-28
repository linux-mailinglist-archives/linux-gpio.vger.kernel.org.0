Return-Path: <linux-gpio+bounces-35662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pp1HMZ78GkaUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:20:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7624813B2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3731F3210600
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57D83DE420;
	Tue, 28 Apr 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJvileAo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828C3D7D78
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367233; cv=none; b=sSrz2nphbgiWrHvEw8DArIgKwhZ5sz4jhrc4LMA4voRGFVsOCtqbLLSvKK04dwa6h6P2VPOxsGQ672Xn2jqKqaSSaIWP0TNnmmgOcZ2GvmyFhkvcwnydBg3c2hiRCXhfHuE4qyh/HEPoD7hCnvTY9F+QyJ5r1uU2TM9qRtSWAUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367233; c=relaxed/simple;
	bh=axPakFE6XDaxmaTUPQlLU7qWGrMa2z/C7/fIYz5ngCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nq+5dSRELLBOx2xMmhfM1E8K7Q2xbbxe/Ing7CEmbepdSMNoCKI4bXuiBkod/7f5BFAUJlvxUH8IDcLtKncDofszUdXmmvIz8yAr6IhW3EECZB1lrjrikXWm3/kXEVYeYKKLWz7Zu26TcQdbfVeDb0BYU+4yIcabOUhCY18H56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJvileAo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFE1C2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367233;
	bh=axPakFE6XDaxmaTUPQlLU7qWGrMa2z/C7/fIYz5ngCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nJvileAono2prHQKrkP1wt7R/pnXzgq0Elx1m3jfhO9aAhIUduOYjQfGMpkw6+9lA
	 +riexkq6zHoSAf0pTUjlkSfv1osvmhGdfNd/mnfyaRLZttcp0wo/K03NOJPW0PIBzZ
	 bSxWzFk4sbjTS7HavWbRDX95yIfvmEYQh22iipJv/r6sq4NT1L5Ho65czVhdoj8iej
	 SItVcnrO2BG4rS9bu0BTYQnDEKLrZvK2lBis1lksknY2yf/fMVLSneO1y5QrEu+l1u
	 ZyR6hmzBbfdf/Y5UmXkMu6naAVq9JnGbNEru878FIT2mgiM6GwNg6VVWE8kyhv8G1Z
	 p9JeTi6YA7gfg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso85747261fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SMZbjZA0PhbjWwFC1vXYXvyijAGcwup6oXuCDwRtCLeNx5RSy4wBgw+gKM5JJ/BJ32WRY1iTB67mk@vger.kernel.org
X-Gm-Message-State: AOJu0YxJvIhSgDcTgRxcyVZUzI5NhgmJKUN36+UmcMmFcZlNcPdU2o/E
	nou5u3GiFVpgM4DjIB6PScuR6L/lGWhD96Jie3y9uOrERkG7mtpg7lsu+V5zD9yg2Me50FsJ6FW
	lg3qnHCwV1N/TWDAMX0BWCm45sHTlCWk=
X-Received: by 2002:a2e:9fcb:0:b0:38c:45f1:1eb7 with SMTP id
 38308e7fff4ca-39240cf4dbamr7006901fa.8.1777367232119; Tue, 28 Apr 2026
 02:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
In-Reply-To: <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:07:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
X-Gm-Features: AVHnY4JlGVgVRYkYeqeILFV2mekTfA6UItb6bX7UB7XQpe6bJ5Kv3rHwYfy_gBU
Message-ID: <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
To: Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CC7624813B2
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35662-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Wed, Apr 22, 2026 at 6:05=E2=80=AFPM Chanhong Jung <happycpu@gmail.com> =
wrote:

> The 74HC595 and 74LVC594 shift registers latch their outputs until the
> first serial write, so boards that depend on a specific power-on pattern
> (for example active-low indicators, reset lines, or other signals that
> must come up non-zero) have no way to express that today: the Linux
> driver always writes zeros from its zero-initialised buffer during
> probe.
>
> Describe a new optional 'registers-default' property that carries a u8
> array - one byte per cascaded register, in the same order used by the
> driver's internal buffer (first byte targets the last register in the
> chain). The Linux driver change that consumes this property follows.
>
> This property is already recognised by the corresponding U-Boot driver
> (drivers/gpio/74x164_gpio.c), so documenting it here brings the two
> bindings back in sync and allows boards to initialise the chain once
> from the bootloader DT and keep the same value after the kernel takes
> over.
>
> Signed-off-by: Chanhong Jung <happycpu@gmail.com>

See
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

  lines-initial-states:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      Bitmask that specifies the initial state of each line.
      When a bit is set to zero, the corresponding line will be initialized=
 to
      the input (pulled-up) state.
      When the  bit is set to one, the line will be initialized to the
      low-level output state.
      If the property is not specified all lines will be initialized to the
      input state.

If you want to set up initial states, use this property.

This also makes it possible for us to centralize the handling later on.

Yours,
Linus Walleij

