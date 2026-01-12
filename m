Return-Path: <linux-gpio+bounces-30448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C78D11DF4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7788B30055B6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF64730EF9D;
	Mon, 12 Jan 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yh4rHxLq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A7280A58
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213831; cv=none; b=bb4D7kFQ9i9VzEYcVQlXpwvp+xm2n78/H6eJzFjY8PNTcaNVd7y111zJ6Yu9kYS+XhziqwS5HB4+Y0EyXbY65N5mZuDTVVadu0YV2k78Nnq4eGQGVy848ti0yuoy76gvSsfC3W74fyKRuE/d1J7gtk9wNe00y8FZAf35WWbfBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213831; c=relaxed/simple;
	bh=qAXTn7Et66KpcLYn2SSecA2gfh2H8lC68yeqSoo4x+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGT9uOfipvWQSAcUg7x+Ptd8+NpDfPkVG9u2S4yr60leVvTesmH9ded1MLUx+NE4frkCiEjdi664eLCJXj2t8ERQixPajTpuWckhCXxZL0Hy/eYSZ3cg7boQwk00d0tKPuoxvkLzxAL4LISayGX5uFMMqJUeMV2qSGzcvKmOjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yh4rHxLq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8A3C16AAE
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213831;
	bh=qAXTn7Et66KpcLYn2SSecA2gfh2H8lC68yeqSoo4x+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yh4rHxLqQ13k0y+cMDsoqDb3STiq9Ae0FA0iDZegdFj+JgU4TF2lIhZ9Et02JxBW6
	 XYanUiP7kzj+rPWeH4wzRysuQLDxTICl+2KevZ+xrn2dAMb5bx02KI3MZpZgtUMeI4
	 dWG8VNo0q58pew6gSxTPE6VNDyqbiL7v0TMOijjAa73Yl+1Dw/9MktIiMvt2MjWZnz
	 9EnclZg30LPj04+kvaLu6NbY8bqeTDB66lKP3MUI0q5vIBbBkwIBFlvIVhDa9OsWfG
	 o0uapMUOLVe5z4wtVY9Vu1IHaq4B+78kfh76bXbR2+wW/ourN5szV4/pWOFjVYbBtx
	 vMDO4SHgH7wig==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6467c5acb7dso5836307d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:30:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHWgvjTkChTITn7yRAY+DprXsDXeSD+SyaYVrTmy36mpWhffnGLFZlEQBfwOPG/It2wLSlbBncdv9o@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFJgqPelZOf/m39DJ+qRMkK4oKe71vzmtl7jdamG6POsVSfXK
	SubYJIGKSlohhGhpLLI+qNdNs02nRsuqb3CbYAF0Gi+IfvF17ROP3m5FD34Jf4H62nTyhNGWTsl
	RAohOSLbNAeWCLYQbzcdoN2NGTVlydg0=
X-Google-Smtp-Source: AGHT+IH16S3HyV8Il3VbBM8ZnwW73KyyNYPWaZmKzDOWtmkby0ZLXv7tAJieIAd9GhoOK6XrcYmuImpuJlleDZB4CQ8=
X-Received: by 2002:a05:690e:210:b0:644:60d9:7534 with SMTP id
 956f58d0204a3-64716cc07cemr9981354d50.90.1768213830585; Mon, 12 Jan 2026
 02:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112064950.3837737-1-rdunlap@infradead.org>
In-Reply-To: <20260112064950.3837737-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:30:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
X-Gm-Features: AZwV_QicDZJtuj2NrUAcQ9NRE6pglGSEpfc6my3wP5L7y3bnSWdUznz5rdhKR8I
Message-ID: <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee@kernel.org>, 
	Robert Marko <robimarko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:49=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> The gpio-tn48m driver is useless without the simple-mfd parent, which is
> not present in the kernel tree, so delete it and all references to it.
> Also delete references to the (missing) mfd driver.
>
> Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Is an equally fine solution to get a rebased version of this patch:
https://lore.kernel.org/all/20220131133049.77780-2-robert.marko@sartura.hr/

to Lee, given that Robert indicates the driver has users?

AFAICT it was just reverted out because of process, not
because of any problem wit the driver/subdrivers themselves.

Lee might have something to add though.

Yours,
Linus Walleij

