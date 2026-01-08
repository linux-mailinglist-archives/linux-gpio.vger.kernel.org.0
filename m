Return-Path: <linux-gpio+bounces-30268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D84D02B9D
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF72D30693FA
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 12:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EE946660B;
	Thu,  8 Jan 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFGfvcbD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6003BF307
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874745; cv=none; b=MFCLwrb6U7tfWYg21DxHSyBE+AtibaehiJrprjctA9SZx5kzwhZ/TdHZON7b6hQX7L4T2Q19i/xHmqJ0bsYv22mCJ9UzdEz5P6OtHzPBDcpKzzYavJR5Kkzrg5UzSpirkPbsXxm/vKRKE5oe8x5bFEv37wgNwOclsdWtdpt0J2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874745; c=relaxed/simple;
	bh=Zzs8BbO1Cf3lrc/V5oQZ41mtZ8hv5XZ7d9ECbp/gbIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jESebcGxJ6vvMwJ96iyr92C43ca4agpUnGSpT2CNaY3TL4fecy6F0OxDfONtL2Gp+k+qSPnsKJzRx0brh15HcheVXqE3xghgwOPoV2aBJZCUQ8TO3clWzBPPp/JVJV/rsp3TRS130w9pceS678Wk1yujbmQ0gHV6I0U21+chntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFGfvcbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92775C19422
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767874744;
	bh=Zzs8BbO1Cf3lrc/V5oQZ41mtZ8hv5XZ7d9ECbp/gbIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EFGfvcbDY1KRcebqFaPdppP4GVA+HxrAhZFDf85i1hjObUycbMby502RFxZkZiGUb
	 JvwtciJ/BsZpPj/frdoVS4FyQXEHL7/BY0PlTOYsC7SXaPbTaq3YYxTLL8tarz2eL/
	 SWaNJBaVhREfFNYIrRefaqy/jW4eA9ngLqkzCh+o0UIGTytadoIbJ8665OYIiCFdRx
	 2ElxlmVEwQfswPTtcyEjTFFuL6/zf2MTSyZ+C6k/P3BQkFpwfsAGC4rfzzh4BwJ4vY
	 YG23BIrvOp7YUJ7DwM/ISquHDPkJIP9/llRMl0kWhwIjTbX2ERjNtHU4wv0FWLnZwd
	 9q06PO6mlYjGA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b6f267721so1762896e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 04:19:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ/svCKzjVKQd9AjS2BT6Jz1nMjwnGFiust+sLJnLBlXopSQTwbkLAvxy10bgclhO3cNOEvUWd0/vV@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGZFvLpdiGjU8w2dzgOHjWT31KFJBn5MO8yqgqP/L2bX+LadQ
	dsKJznF4pddZk3iFXMksHFraCaZYaWmwqnytX3TXC5nBUol8NosgBfB5oEj8DNCvswknzAOmq+P
	DVSqM9u1GAIwfIwPbVtHzApRGsaRq5q1L70sGqe4omA==
X-Google-Smtp-Source: AGHT+IHOgtEqx+Ygk49C5nlM6HJAxCKi4X5SZGSe1HEVDX5vQrTWC91zUsqGkhn+9vUUMYMgjzuOxltx/RKWK0ZgGkw=
X-Received: by 2002:a05:6512:ac9:b0:594:39bf:6d4b with SMTP id
 2adb3069b0e04-59b6f051e13mr2053759e87.46.1767874743259; Thu, 08 Jan 2026
 04:19:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com> <2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>
In-Reply-To: <2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 13:18:50 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me5nNXU0foqToYs4W8fvbTZ0DZSRXAQ7rfHdbcoB4+7cQ@mail.gmail.com>
X-Gm-Features: AQt7F2rUqk9PfzG0xcDr74zuZBDFsatMYW3-MPydaQfF_79jlzLKt-tnskROPaI
Message-ID: <CAMRc=Me5nNXU0foqToYs4W8fvbTZ0DZSRXAQ7rfHdbcoB4+7cQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:13=E2=80=AFPM Cosmin Tanislav <demonsingur@gmail.c=
om> wrote:
>
> On 1/6/26 11:34 AM, Bartosz Golaszewski wrote:
> > Here are three more patches fixing issues reported with shared GPIO
> > management.
> >
>
> I'm still getting some intermittent failures on today's next (which
> contains this series).
>
> This does not seem to happen on every boot, so it might be some race.
>

Should be fixed by:
https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@oss.=
qualcomm.com/

Please give it a try and I'll queue it shortly.

Bart

