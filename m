Return-Path: <linux-gpio+bounces-33128-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCBXL1ZmsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33128-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:55:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E31263F4C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAD8C3007AF3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738B9286889;
	Wed, 11 Mar 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cylPeOfI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2B23D283
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233743; cv=none; b=VqLg5WeqQG4oIbP3/QPpxorVA7yzfuZ+0vcShkRlHY/Smmk8PksM1a5ck9nnJTF5+f7b2nj9ioizqxA7vL4E3oJD01UdYF4UZSJDjKMNQXg2WiLwwK6DiUOf3OvvDwXCVTW3yevd/vfiEkx0e/Q4iFrEjruj28KKhrHjnOdtGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233743; c=relaxed/simple;
	bh=2GVsfvg4Jf9A/LBCBeCs5YsO1+dzrrQUqDYfs0uiaUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlaQQx9f7VpZxpUI8v7Zvn/lfShQQDT03nRo01CZOXjLfZkXpDIQzPICpMdt4etP/TGVCGtSvoaOrNO/wBL7GQVndkSloHgZUn6bwmH/XFG73wge+5vqpdheswPlo3WSxUemUZrRYNGcvFEOVajqyq9tmjtPYP43e0fJobbuoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cylPeOfI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B0C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233742;
	bh=2GVsfvg4Jf9A/LBCBeCs5YsO1+dzrrQUqDYfs0uiaUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cylPeOfICYyVbFV6XuEY1fFRUbX8RlNnPMjWlOHG2Y+xM7e/rSELIx4Lb4HO1F8MW
	 T7eOidu7ETAQz6CAZ9PvDZ41IINIjzyjwYgfLTsp+sbQ8cbnQbWGVRdj4d+1QFKiuE
	 ykJd79Kyo66R1cy1LKApiQ8BXYURTTXnXnEUhJIaCMO/z/ZGgRY6cFGT4tfnddR3am
	 wdJsxS2Hn0Rnx3eVIzsiYGpuGKw3BzV/YaQvYZd2o3+DPmk/EutbcrPeQC/RG8bGLa
	 KHMrjZWwMRpntKiN5QZMPg/48cG1Jbg2b7CJg6gH1Gh99A8T9UpnfFuPn2oAK1vHQK
	 DUu7ywnBquNHA==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so12884202d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 05:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAnqPYsjNsAg7arpoBtGQ7K8CrOxxZvzT0/YfVDrt9airPaAL7mQtO7qgsZYHafFo/rWGpzT+RGk+N@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRyStMGSFGs+FEYC+Yxb6AmzcOynGXCBxY2sT/ztrsYslenXR
	z/VO9ZZnR2Z4m8CyBINMvdteeF55ciXzvRVHQxgPJYEUvQwLfsgS6WKElFDgdqs/iIs50kmKa47
	jYYTOhHSxcLAvh5U9WwjLC6IJ4eZ3s+k=
X-Received: by 2002:a05:690e:2512:20b0:649:44ac:cc01 with SMTP id
 956f58d0204a3-64d657d7299mr1599764d50.55.1773233742252; Wed, 11 Mar 2026
 05:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-ascertain-overblown-955becc1d8a3@spud>
In-Reply-To: <20260310-ascertain-overblown-955becc1d8a3@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 13:55:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLk3eFw2AqjEj_xEbdOHSix282+W0n2eDyoGUZ+3cE9_zA@mail.gmail.com>
X-Gm-Features: AaiRm51B-8gK26d4Z1OQ6QAitl9GykOYfkoQ3yArFhtKT8AU-q9D-97qO0mfU9o
Message-ID: <CAD++jLk3eFw2AqjEj_xEbdOHSix282+W0n2eDyoGUZ+3cE9_zA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: pincfg-node: permit
 bias-high-impedance with other bias properties
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B8E31263F4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33128-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,microchip.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 6:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> It is possible that devices tristate buffers may set the buffer to
> the high-Z state in addition to setting pull-up or pull-down on a pin.
> Remove this particular restriction to prevent warning on zynqmp systems
> where this configuration seems to be valid.
>
> Reported-by: Rob Herring (Arm) <robh@kernel.org>
> Fixes: a901e8705f89f ("dt-bindings: pinctrl: pincfg-node: add restriction=
s on conflicting properties")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to devel (next) so we rid the warnings, thanks!

Yours,
Linus Walleij

