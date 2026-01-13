Return-Path: <linux-gpio+bounces-30474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E7D17F75
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 850E4303A0B1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B1D38A289;
	Tue, 13 Jan 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsXfXaSX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358D33F39A
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299396; cv=none; b=UFArcv7TSFNxp+P+YoEr63GtmZsBBgHaRW1L7bepgDOKf7R8wOwdzLLlCZZ68zy7rUZMfAR0C2idy5/iaLRj79UYqobjCZKW9eXXZMLLeiURMPCbXPGfAmduKP2gbRNGF8+V9fUO9Zci8laGGhsxviU5GcYtUn6GUcxrWM/jmdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299396; c=relaxed/simple;
	bh=esJopZltAYLgnCkMFpcVoEU+Symng30ZWIG9S/09MMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWImytueR7QcTDnW5j1/ALd68ffaCWm8xKUjtP+LjJiIWtFuhQzynDjd3aw90Oj1CXKbD7XRRvZ6HHats+TqdYkAMfdf2EwhhT0/hvgxJHxF0STQQDj5t5xhLnwkyP2HdU+unoIdb43jnpKqsoiA+gJnGO94+M9oDykqt7OmmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsXfXaSX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CF1C19425
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299396;
	bh=esJopZltAYLgnCkMFpcVoEU+Symng30ZWIG9S/09MMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PsXfXaSXiYCIrhfrhsGko6AbyWMwYnErOulAKg/POyVM2UoEicr0Pa6IlU1BRQ3CQ
	 FVf4b7d4LluePaGPr91wRFk51bB1GNZPDGEZ1Dkd07T3m3sz5wv5iULVxI7y2RJLR4
	 C1CnLbO/YvtvwY2AbmvB46pYF3p38Fx6fJjUFZbwOX+gwuK9ueP00Ph97GYj3FNbQY
	 u0fwJb2PxMAENWpOIOZDjIJFzUjW4vtKav2SSKY0YSklvCilHV2Q27YjI5tbZ8M7UU
	 MIT2LODliPT+QpUr7DSG4emL13V07953yX08A0WgRBLI3ciiaAXgtAvmq96YDGRlkM
	 08XMPWdnLi9Tw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6455a60c11fso6090266d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 02:16:36 -0800 (PST)
X-Gm-Message-State: AOJu0Yx0QWvrqez/zQzAdSwl1Bji3QL8s7D+QQKgm83dxBYmH7vpqX1U
	kVPrwCVnkxyxQzDgW/aHO0wNBOp4GbaskO4Uug5fHn9pDBk8LWEWNoM4G8nGdBEf5Twri+0ZZiB
	s6yjlMBqao00+WTgXe6n2YLWgNZ4V5ik=
X-Google-Smtp-Source: AGHT+IHLWvZFPf8gpkvECRT5kxigrgOU/zHWyL4XbgAJPtbwN+X0sn698hc93DNyjCALyHhm11rGO5LOG65vOxDKNDI=
X-Received: by 2002:a05:690e:1347:b0:648:ff21:94c3 with SMTP id
 956f58d0204a3-648ff21952dmr109375d50.23.1768299395810; Tue, 13 Jan 2026
 02:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com> <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:16:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvNcLa41kaBcNTrm-e1GsBGF3ASkxLVFZhCz4A-bt__g@mail.gmail.com>
X-Gm-Features: AZwV_QiLa5ZzXE0uC8Ol6kIL4q5ZCh6S5hzcDzOPP2MdblUDCebOSx5WnAff9u0
Message-ID: <CAD++jLmvNcLa41kaBcNTrm-e1GsBGF3ASkxLVFZhCz4A-bt__g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: pca9570: Use devm_mutex_init() for mutex initialization
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:09=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
> cleanup during probe failure and driver removal.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

