Return-Path: <linux-gpio+bounces-30110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54653CF1D49
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 05:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D90B2300E7FC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 04:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068BF32549E;
	Mon,  5 Jan 2026 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ho85gyha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE5A324B19
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589037; cv=none; b=J6YL/Tzg/hYs3Y44QB38io7Cm+egyzCij63HyuCh4W2l2YGYStQ5EbUoBQYcX9FjWH302OT28BJkLfna5Z51iScu14yQWxmNNWpXRrzcJxUVlujK/b/duv082uniKQyWGoMILLhSuHRvZtxTN6DF/kGf8g7UaQHvtPbAEbvOoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589037; c=relaxed/simple;
	bh=wdM/b8hJbUaslNLfaUyaSG8t8yHTFzri8J0kMFatf2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Acz3kkG9GWqQzyk8r5JRklfAJ3Tz1ncZ2GK2M6WHwMV2GRn8dHePukH0zzDJ8Tl3fkr1ok0ni+sefPF+clOx3yb5hfbnyJMpOdueF0nYxFLlrbe75K/jUdcEOq2JAF+G47zN3KPqesy6hsGJrW5hc+pGqM1pCVFuHtgfpaWX4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ho85gyha; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so11676814a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 20:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767589034; x=1768193834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOEgCzmZP0GTJHcnce/bEe96Bif2a5t1CJ7MWxViYzU=;
        b=ho85gyhaKzhQd2LkobbDGyUs+P/owvm/KOpiZS4dO+Gf4YuFWvgFamob9qdCJ9r9lk
         CLr9/RyFtHqQFUBotNoAM7KhHAtZt1Jp5d0KrfTfEbwagr6SxMdsx/4fE0BSAkcxMDYW
         hBxIWUZzrdi1VxRIajuMMCUWM94J/ABCw0OqR1S9Q7KJQTpTvaIEnHNlkPc5J/4jESGd
         XTIkIW6zDUqzcVTAuqoCRGwL3BR2rGk9MaM3FmQJSNYeqluqV2cf553LNAaO+Ru5IIr6
         vpnPaBULT5dfb6ydqqvBTOTjU7RSO1ix7RqULQUiOx2UaSolPasj3CB9WpJAXHp8n2jn
         ZWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767589034; x=1768193834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEgCzmZP0GTJHcnce/bEe96Bif2a5t1CJ7MWxViYzU=;
        b=HbK1b3CwYaj/ohJ/ghNxP5siMczFBuLQ2QngZLSQsVZmlqiY5CVDrJxz995gKe7elw
         QgVOSWKPJsQHKq7L8EkLcdghd/2kts1JStEF2e0G/Z5dpxL4v21Ei4ieppCgc4NnMxsF
         0jve/A/rwI78HyNOqIiBRq+2V5mrIfZGGcNNJwIS/4nG6hOU4E+WiFTCJJRaMXwkesMs
         jEnAUIEYHSNEZITpdyfkrRrM/1ljIiE6SugJePxSVyeQ33Xs+b1xzrg2L4aSzeFMZQCQ
         4HTd3JZqapUFLC9YY6YRuzeZq7Retc4ES/8T/GVZRyvkbvMK2/iB6QStCIvOJfIjZSlI
         Tbpg==
X-Forwarded-Encrypted: i=1; AJvYcCVnU51UlwNlTFZwc7tvsOQFIpgeWTR9XLmy7dJKVZHOFgMSg2ql3IeU9qfKNIYcZ/ZZT0bGGhtir52H@vger.kernel.org
X-Gm-Message-State: AOJu0YzmI30pNWWS3ce7vyNon+tRZs2AHSMYtx/QmRlA/1MrCAgz0+Ot
	5bUsgL+jOC7hFniLfvmxt3PVi63JkiE8EuYLkuE7UUBd3tJR5fhA0Kj+9vJT4xGNV9k=
X-Gm-Gg: AY/fxX7IcqdeMLhKj0Df3AJwKaxUEtqrKQtu2KumMn0XdgFBQ5QF16JFLv8NduNTDXI
	YALjpI82YYB7yZepc5p/Ny/V0u+roiqtJuPJ5VwJuFap4r2Inr0w/Vz7f8VyjuDap/0OQo0fiQz
	i+rzdUHIvUc/u/TFvAXI4eIAHnarMQcgJB/JRoKhLpPilNtDqjpg8r2Ci6UPVu5JMvttTlxx+NB
	78GP+IY7GDkHPXagoE024rfzL2XJX+oLs5ADDLw0n6OgaIe6pbU8QDMQe0f/VyOXqCIHEKDy5Pq
	Q6k/15eSYpxSk8hbjCPUdzXXl/YYYEWaeRoDLBEDFxEj7kPEbWdZrGdiR8Mms/8+yNPKXr/k0UD
	8AtBUt9cnK5moV7xiI0foe3S1jyc3UDTPM3nTW5y4fGnQ9huzRZakKGd4toAAA5yjEapmCAifU6
	p0Zjj2WReB5kOnGbr0a3Dw3A==
X-Google-Smtp-Source: AGHT+IECK/LcBFPZYYyRh4cCx6nIWU2Vivu4V4Wo0++VXRb6DotO+ATVsJPLekWH+2yfoIoKe3qHow==
X-Received: by 2002:a17:90b:278d:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-34e921f0439mr39742351a91.35.1767589033897;
        Sun, 04 Jan 2026 20:57:13 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476ec31dsm4899585a91.3.2026.01.04.20.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 20:57:13 -0800 (PST)
Date: Mon, 5 Jan 2026 10:27:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Petr Tesarik <ptesarik@suse.com>, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, netdev@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC 15/13] gpio: virtio: reorder fields to reduce struct
 padding
Message-ID: <w6to6itartzrxgapaj6dys2q3yqqoz3zetpb5bejnjb4heof2c@jkhmal3chyn2>
References: <cover.1767089672.git.mst@redhat.com>
 <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>

On 30-12-25, 11:40, Michael S. Tsirkin wrote:
> Reorder struct virtio_gpio_line fields to place the DMA buffers (req/res)
> last. This eliminates the need for __dma_from_device_aligned_end padding
> after the DMA buffer, since struct tail padding naturally protects it,
> making the struct a bit smaller.
> 
> Size reduction estimation when ARCH_DMA_MINALIGN=128:
> - request is 8 bytes
> - response is 2 bytes
> - removing _end saves up to 128-6=122 bytes padding to align rxlen field
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/gpio/gpio-virtio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

