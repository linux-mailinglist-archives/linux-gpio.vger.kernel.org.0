Return-Path: <linux-gpio+bounces-30080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09929CEEAC7
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 14:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4E930222CA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 13:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69704311C2C;
	Fri,  2 Jan 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/LYyrVW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9C311967
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360498; cv=none; b=anXoX36KgK8sR7q6zng0ZXTy8UFn8vIwHauUqB0UBDrWrPGl3kTe0iCHsH6qxN9Qjt9hlIkVzCSyzZHwevRhECsWu7P/Vn+jtZeOhmwQzUtSdYzdiSfS+7h0iJFZW0liI+WiUA/M72UDABS/mN0iigIdse7yX7zSwSGwsb7/rGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360498; c=relaxed/simple;
	bh=caKMln/4An5074vy/0LbmODygrWbyLltEqRTVzyaZyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvkflUw/xz7EGspGaLJjWOMip8kiWUoHwL3omeZWpjSApfwR5aerdPb0yYaGODTEUwWaygNtimELVY5TTLm/1rrYeXwpME5M6RDxP/Yyar3n55m1skeXVexLb9c3vmUiDQLdd6US9zn2CUfJdY8qgJt+704dnjvckuPpwEQETi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/LYyrVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E66C19425
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767360497;
	bh=caKMln/4An5074vy/0LbmODygrWbyLltEqRTVzyaZyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/LYyrVWYBX6/xiFBJCYzPt2mAjHPCdML6RZHqYxHB3JLuG+XVa48k+IbFa1/ydYH
	 yzLWkGX2d/nsNwNLBfGEKgQx/Y31IcJRJytcsUrwFYWxV4I4ndl8HDE1gsWW9D+fsW
	 tkOdzT6QA4VM80ok+nOp6C16Iy1MKAT95Q/2l9114MivMXUzbox1yPNxO2sfnrqTwX
	 pm8UKITq5tQDOE65/Qnd0pkfKV9M7ZB31pmItU0vWSV/qe8rZrpUm2qM/b1BHC1YYp
	 F/QZg0d4SfPs97bZzrucZYLPyO4UX37A651XQnEg9dQ930Z2nK3qcF40HhLqhQRSeU
	 h/5hZzEbjYRDQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-598eaafa587so13826659e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 05:28:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVVJbs8tg0sCZczRN3R/u5yQlIxHZZuDnZr2qQgpT+qdmUe1v6/CWN9y4oUo6Dqxbvd3zHKjIhNbUy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzcIvpehRagVHr/TlOjcjwLNKS1vMen7RupP2nWK4yYCDqzTp
	rV4HCLgvBL4qxetBR1I/SBDLZF2mob2xVLR6laflHW4FdaTZY/v7QODcItyDdcluLffZOlPNKn2
	878nSDdl3lKBh9HuMBZBS/Et5V2phvW3pX/0GmiWZHQ==
X-Google-Smtp-Source: AGHT+IHHF6srkWGBj0h2W2m125Q8RRqweGoiS7tVO11k+MLcdE1dgvfbJ2DaGFg9ECUq+/XShJKxHMrRpS3Ip55rUHI=
X-Received: by 2002:a05:6512:398c:b0:594:522d:68f4 with SMTP id
 2adb3069b0e04-59a17de2c1amr14462802e87.28.1767360495900; Fri, 02 Jan 2026
 05:28:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767089672.git.mst@redhat.com> <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>
 <CAMRc=MfWX5CZ6GL0ph1g-KupBS3gaztk=VxTnfC1QwUvQmuZrg@mail.gmail.com> <20260102080135-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260102080135-mutt-send-email-mst@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 14:27:50 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdWWQihgt8haFYxSh7MgUoBuf3ZkBA6cbErSVNmAtb8Mw@mail.gmail.com>
X-Gm-Features: AQt7F2qkcWsOmteak3UHSQG8tO-rpcwm3KC2_8dv0RlxH64IzhKa8xcVzXSnZm4
Message-ID: <CAMRc=MdWWQihgt8haFYxSh7MgUoBuf3ZkBA6cbErSVNmAtb8Mw@mail.gmail.com>
Subject: Re: [PATCH RFC 15/13] gpio: virtio: reorder fields to reduce struct padding
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Petr Tesarik <ptesarik@suse.com>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 2:02=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Jan 02, 2026 at 12:47:04PM +0000, Bartosz Golaszewski wrote:
> > On Tue, 30 Dec 2025 17:40:33 +0100, "Michael S. Tsirkin" <mst@redhat.co=
m> said:
> > > Reorder struct virtio_gpio_line fields to place the DMA buffers (req/=
res)
> > > last. This eliminates the need for __dma_from_device_aligned_end padd=
ing
> > > after the DMA buffer, since struct tail padding naturally protects it=
,
> > > making the struct a bit smaller.
> > >
> > > Size reduction estimation when ARCH_DMA_MINALIGN=3D128:
> > > - request is 8 bytes
> > > - response is 2 bytes
> > > - removing _end saves up to 128-6=3D122 bytes padding to align rxlen =
field
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  drivers/gpio/gpio-virtio.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> > > index 32b578b46df8..8b30a94e4625 100644
> > > --- a/drivers/gpio/gpio-virtio.c
> > > +++ b/drivers/gpio/gpio-virtio.c
> > > @@ -26,12 +26,11 @@ struct virtio_gpio_line {
> > >     struct mutex lock; /* Protects line operation */
> > >     struct completion completion;
> > >
> > > +   unsigned int rxlen;
> > > +
> > >     __dma_from_device_aligned_begin
> > >     struct virtio_gpio_request req;
> > >     struct virtio_gpio_response res;
> > > -
> > > -   __dma_from_device_aligned_end
> > > -   unsigned int rxlen;
> > >  };
> > >
> > >  struct vgpio_irq_line {
> > > --
> > > MST
> > >
> > >
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Thanks! There's a new API as suggested by Petr so these patches got chang=
ed,
> but the same idea. Do you want me to carry your ack or you prefer to
> re-review?
>
> --
> MST
>

I'll take a second look. Can you Cc me on all the key patches - like
the ones introducing new APIs? I needed to grab it from lore this
time.

Bart

