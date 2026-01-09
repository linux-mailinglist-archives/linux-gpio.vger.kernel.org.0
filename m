Return-Path: <linux-gpio+bounces-30314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CAD082FC
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 500B430049E1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01AC3596F1;
	Fri,  9 Jan 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oESO5b0b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32703596E2
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950889; cv=none; b=oVtroZLEkLagOwTBJwt6jFzMaL0PfB25ZLbFqqNZBv8eTnogBOhbm4Hq1mELm+2uW9yx/6pYI538kP22bOfr/KYOgMXC2prT8lu5h+mwhV/dcgoec+6x2JCs25fj5XK8k0uadwUr5panfzFFpOOV2TrOXY7uxr0kJV3CJ+Z+J7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950889; c=relaxed/simple;
	bh=TvTxCwT1MWd7gEL/8ireQ19H/sjhSB8ChYnUaP5r9qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPl0na/LwovwQ/fI2L9cBBrr39L+lfypswvCm9CfqpIG2IBrvbaO+tMHSkSQBbQWjJisB2c5v2eZgBnvaoM+lCJlqJmF9F4mFphdy+HJfXfsMG+YSWAMN/KLPdB41f3fRCyPSTggeLjKBMNuUbxMRgqC9Qr5OTUiJ2VY1vQQsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oESO5b0b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A7DC19424
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767950889;
	bh=TvTxCwT1MWd7gEL/8ireQ19H/sjhSB8ChYnUaP5r9qM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oESO5b0bbCIN0Itpxe+cT0ruk3eXIkdK9g3GXtRKL3LbgOhgBr4wcDqIT4X41efRK
	 E7HOPn+DeG84OyQYlbxK6k9oQOxq6IB0FX6+9B/MRceY1FKGknVYRJ453bMEFQrFCb
	 b8D0PB2QX1O+kXEQhOW/XNQqE+6F2pzV9dmuX4SjFxcEt+OuN4OHUUpsFcqnLETSiN
	 Yboy5In7i84kaq61jC3F8N+/dZp5gVLnKlazwvifkocTrZnQ/e3u9I+/O20qzIyrhu
	 ni905de7SyATTkkQYx9W9AeL6IuVmc7AEAruZ4Gmzxy3H9bLZ7/q0U6gle+VMVaa+E
	 MORu8R0WxtmKw==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6467b7c3853so3096441d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:28:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0td8fv1E3Q/8nwT62yNAriTgf3q6JyFdkWy10MK8/CV7lSu13dILaI4d1HSaJuT7q4KmO1pPKudxM@vger.kernel.org
X-Gm-Message-State: AOJu0YzwC8kxTTm6840JrR8u/a3xgZMTm+WzFcnhl2f7AtT9/r+OgyA5
	J1pHAgdJgkUlX+YkWWZwij5A5OXzvzSnc4q065AVhFkFrbetSEC0RLK24KcYn9bUovH8iMTIUSI
	S34Bc4K0U43eLA6rZ37ogjwJTZ+/6Z+k=
X-Google-Smtp-Source: AGHT+IGLYO+PXEEAKW1FMLCf5oqS/vkR1TZS50taWakCTHMCvqNmDRTQBKk5mLCErveZ7JgIcDUPhMAkXeakrJ0ktWk=
X-Received: by 2002:a05:690e:1243:b0:645:415f:a9d with SMTP id
 956f58d0204a3-64716b35d89mr8241265d50.20.1767950888686; Fri, 09 Jan 2026
 01:28:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224123748.2875868-1-weibu@redadmin.org>
In-Reply-To: <20251224123748.2875868-1-weibu@redadmin.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:27:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iUWVQ1i2+eP=VwmXjfaXZ2Siv3VaUCCpACHNp5wK-RA@mail.gmail.com>
X-Gm-Features: AZwV_QjhSWfDwbQyHGi5ycNPq24TyFV4dZ0nWxpeiZ_ricMJhC_iU3luzGuIDG4
Message-ID: <CAD++jL=iUWVQ1i2+eP=VwmXjfaXZ2Siv3VaUCCpACHNp5wK-RA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: keembay: fix typo
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 1:38=E2=80=AFPM Akiyoshi Kurita <weibu@redadmin.org=
> wrote:

> Fix a typo in the documentation ("upto" -> "up to").
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Patch applied!

Yours,
Linus Walleij

