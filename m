Return-Path: <linux-gpio+bounces-30140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F8CF2D64
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40078301CE94
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C90C331234;
	Mon,  5 Jan 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exxkdiE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03EC238C33
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606526; cv=none; b=P7QTxzRfw8QI+SisfIZcEVdVdnV4rwiOXJLX9ojJbqs3d6BFklcijsQ8SV+7Xgit5YcxOg0YMN/QiAbVUCn2CjLLhnEFl6r6WAxkeN5wDdUwa5LoaV62UBYyLpZr1XQJnXbPf42PZnNEZ2OKKHAZRWnfbO3O84QBFfOOC9KRPoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606526; c=relaxed/simple;
	bh=6q4rbOvtQc/l6ny7b0UltUYitu5vdZwgjySiMXgs9uA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4kNPzMKkteGRv3METii3aaDBfbHqpujG1jdx9ECXea8jTLLXl53rmEi8p79MMm99xQLDjgwVInzcgOsVe+CdfLLHHxMpXabaWtG5sdnydBdx2voO4AfJ7h2qu0oEZfeT/Udf00r449DrI5kLOUOR+pR+LfUocrhksAOzldWtw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exxkdiE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE817C19421
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767606525;
	bh=6q4rbOvtQc/l6ny7b0UltUYitu5vdZwgjySiMXgs9uA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=exxkdiE7UjGiZqB2J/eou943aCMx5hsubgpD7ExwsMCi/6lwoND6nvsZnMB4pW6Bt
	 hKtQn7IluKRtQwJyJOxcBn4+O5OZ9rOLEwRcTI3SVtLWAZehXBG8vsr44KMc2KtLxh
	 MtqgZL8Sg/H8/gyz4V7qqepgc3U65JWRwe3uSF+pm//rp2Yt4LU9uj+R6ZsbDnBhH4
	 cZZIeMAHZFktYgJZGTjm7F+czsLwO67K8FrkIP/Xho7Gy9POf2+0BDTj6Rbk8G8FMa
	 tvluhjeHentwvwJtfmG1uqjIsBP9soO1yywzL0G9hhvXx83su0buGSbSeqy4gxlfB7
	 lVF9+0wkvnXug==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37a3340391cso113266261fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxNmjVf81TG5KBE62rPEuj5M9Sn0uEDa7leFP+wbLhaO0maf/3x7PHY3HwEDjWISYuxqPBHTAvw/ek@vger.kernel.org
X-Gm-Message-State: AOJu0YwmaFLv79v9alHkPDg7R4Hd83QEI9PA1kZAMQ/AcCmNKjr0bOfY
	6K88cJ3NjUIWJuLo3Abd33pR6yCRvatxTo7LWL0KYvreZGtyszFkEn078XT0Gmtof3awu48GQ2d
	XNTHh5riuGgFdacNcbNXD0sakIATxZcR/LuTRt5xqYg==
X-Google-Smtp-Source: AGHT+IGSKxzTqFupha+/kP/9OhPk5CHWYocIBLA8c0aZ781oqxoVi+m5tGX4lmfLkQ2ICgVlTbbSWoJqxN5UEvT+0Ew=
X-Received: by 2002:a05:651c:1546:b0:37b:a664:acde with SMTP id
 38308e7fff4ca-3812161c9bfmr156575261fa.32.1767606524418; Mon, 05 Jan 2026
 01:48:44 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:48:42 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:48:42 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ba7e025a6c84aed012421468d83639e5dae982b0.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767601130.git.mst@redhat.com> <ba7e025a6c84aed012421468d83639e5dae982b0.1767601130.git.mst@redhat.com>
Date: Mon, 5 Jan 2026 01:48:42 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdbGd3Sz+3zV23rqsKYjhy7PMcjMQ5p_Td-Pvq_gVS2Cw@mail.gmail.com>
X-Gm-Features: AQt7F2qC8Cp-OrWRK_Qp1sfgkcgDE0sKs_R5olkkzBcXry5HJu_QhIjQMPa71p0
Message-ID: <CAMRc=MdbGd3Sz+3zV23rqsKYjhy7PMcjMQ5p_Td-Pvq_gVS2Cw@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] gpio: virtio: fix DMA alignment
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Petr Tesarik <ptesarik@suse.com>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 09:23:45 +0100, "Michael S. Tsirkin" <mst@redhat.com> said:
> The res and ires buffers in struct virtio_gpio_line and struct
> vgpio_irq_line respectively are used for DMA_FROM_DEVICE via
> virtqueue_add_sgs().  However, within these structs, even though these
> elements are tagged as ____cacheline_aligned, adjacent struct elements
> can share DMA cachelines on platforms where ARCH_DMA_MINALIGN >
> L1_CACHE_BYTES (e.g., arm64 with 128-byte DMA alignment but 64-byte
> cache lines).
>
> The existing ____cacheline_aligned annotation aligns to L1_CACHE_BYTES
> which is not always sufficient for DMA alignment. For example, with
> L1_CACHE_BYTES = 32 and ARCH_DMA_MINALIGN = 128
>   - irq_lines[0].ires at offset 128
>   - irq_lines[1].type at offset 192
> both in same 128-byte DMA cacheline [128-256)
>
> When the device writes to irq_lines[0].ires and the CPU concurrently
> modifies one of irq_lines[1].type/disabled/masked/queued flags,
> corruption can occur on non-cache-coherent platforms.
>
> Fix by using __dma_from_device_group_begin()/end() annotations on the
> DMA buffers. Drop ____cacheline_aligned - it's not required to isolate
> request and response, and keeping them would increase the memory cost.
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

