Return-Path: <linux-gpio+bounces-39436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xCIgOO8uSGq3nQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:51:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A109705F90
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:51:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=byiF63I5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39436-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39436-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C0F5301C6E0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5BC32B9A1;
	Fri,  3 Jul 2026 21:51:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A272FE0F
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:51:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783115498; cv=pass; b=bmQp1baJwZ3c9zWlxuiY/AWQn5NaBVHK4z3+0T8cC+iy9EGgeBVXCoPa3HUBLupLJkoquzv/h5wsTxVPCTat7y/LoDwRkfZ0P0Xt7IMoNLdx7/0ZEojupIetEIAT8jWnZ3oND4NWRWnSepoItl442EifqGyMo3Dt2HKQ7Oo+DiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783115498; c=relaxed/simple;
	bh=O8TeWJwjSerP8JulIAHgI6qJbohNfsKKKSQ7IKbfR7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlGMuvbUAd2PcXgFXvxjSo6j7vptEJZnszHQkEdTgf3qPUrfW8QpsdMXQC/ZZRNsdluB6v2LockZ37Qp40gYocd8QRu9/HNa6VPrRmX6I+LjxDUUDLDiS0fQ7vJ8UkXBKPQJoUAarWuE2sNmCxxtkIy5LQCHApZzbI3+7ORnWcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byiF63I5; arc=pass smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso1590992a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783115496; cv=none;
        d=google.com; s=arc-20260327;
        b=pI5r4TdrTJHxEj9BMBZhGPooy9A0aUEUo2CnkBaRNRKVkk4J8dwHWy40271LLcu4fP
         Ht+oozjm5qvOGgPlaT6fG58aP6sPap1RjUCD7jI5fOfTk/fnsNUI6LKeM6F6ZHhXBmel
         lfALw+z4NuN9AW8mXb5AQlN8FC5auYnk62zOUDgeb6VFxAjCzpthaKNHPPEZyyFaL2jr
         g+7blLmzmqECcJbPTlzMkscDK+8bza+2V47ytfOSDTV7Tspoj3kL7sPAImvFlpSAnUJx
         emQqweHQoaSFf2XSpzZ2SLHkg1BwkRLnraTObYRN5hvsEM2dg/F1QrFuTuItinDpFfSH
         KqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O8TeWJwjSerP8JulIAHgI6qJbohNfsKKKSQ7IKbfR7k=;
        fh=GhFBK1QHscPorqKcv7qc/2De2HLu4y4MN6w8EmDacAY=;
        b=T3JTYe64JBp+RcNmeXPTlOs6W4ykg+8JDZ+ChfDy33e24+OejwPrE2xgKF9JyKe28Q
         vRCugw9dTgDJZL6JT0IfcS8GZWiMnavcx8Fz6YOR4wqOkm814/s5J5YYYiqqa1OmxY8V
         CYAeLTt8K/HWwD9DEtiYlwuwoXMssrh+6Z8G9wSKTrO/GUvyNkSLeb7f6SB8r6oN+SLC
         HEg3bt2iRVCuRTudL2P2QEOWjCT41i5Hv1CdJmk/0BilY5PpsBtK18MxL42O5L6ixwYU
         FhkUK2oElmT9KQTUBtDeFeJ2pQjEnA7CMmpWowu+NddSeZjLhfG1196pr84fjQiioVWU
         W4Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783115496; x=1783720296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8TeWJwjSerP8JulIAHgI6qJbohNfsKKKSQ7IKbfR7k=;
        b=byiF63I5Q0/YmNtTgicDrBQ3YjjXWy1jOh1+AJQV/YNFNwGjJNo+30skgFVwlcVy5+
         n4AcOjfg7I1F1QET0LljfZMk03sDRek82d/cKsM1vPq9ksn2NvaSW4i5bDB1+60HPeeW
         FdPfa7nBA/3IGdEThMNpiJMz+CKWPfWwkftH38+ceFnJ28IdWSKopMt5fD1ABKnphTdJ
         oR49N0ONp5ENp8KxLTPRa8qBbzU8oNA03inZ7MFgMND6537Bwc5WwakOJyqj+GBlVnpj
         K2cZf3CcrobB/DYfNl+kS5RvMP2auq5NqOVQwpMa8T3oJTOHvqyjQsZ9OSg+unCRAbuk
         Mk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783115496; x=1783720296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8TeWJwjSerP8JulIAHgI6qJbohNfsKKKSQ7IKbfR7k=;
        b=bPIoBZ0yqd7FzmExS+TM2JprZ0HEM318mzCd2kGAHy/3Ojxv07qLyM9ZZEayoiEMj/
         bEzJso3uUArFqCpd1fzKuC5LrCM7k1BeskQUzDSfuCf7UuMjP3RKP9PSrfwmKaQhdS+i
         Xin9JPhkPFO02t2Y0v5uoAwLi2t8CCEOL6nyftOs2VfjioS0eBavsG+aVx5qXiMAzlTE
         rpTUXuXz1yKUDvmQDTv1hsMaI20V5DB+OV/bU8MLKwEWwkTQcHNyEKVyim/RmqP+t3sY
         Ji1rQtECULal40f/ZBfTa0gy6UsfgKiLNQR2I36eEK+/yLklIEWtDU3RbsdbHEgy147T
         YXbw==
X-Gm-Message-State: AOJu0YwvXCO58Rwte8rjfWUOa0EuAgdLzkuc3xKmGSK9cL+1D7AsKJt7
	8BlPbAXTU78yNMTsfrqJveW4DbGF00gMI0T0ORM57JKpU+QVAZZicaKvfcVX1+b23CdnoptMBrr
	zwC6HVtTLtDzbpkKzQW86IQ6DM0nvdpc=
X-Gm-Gg: AfdE7clYJfE9JxGqOpwBjzfDwqoqwpx6etOodzPu6qKLIJIADvN8OYUHZSMfYSCoMMX
	uasYSYEuDtjEoD6dW5XJGE5a6QE28A2ftBK1sB6IhtRFkTGWB86lYDBslYaBPEV6xEBYi8sXhcn
	SB6uHtlx9nOivtwkJ4hgFQHMI/ZKz4OknXL2S/I/gVQWYTllJsl8vfFsCbXcZDwnyDFXVER9p6f
	BrFhIQI87xO8u3uq6OUATuS0b1S7kC5Uu3MIomvC8KD8ZW0KLOWR5pRsxLKpadoHGqy1LnZTpvi
	Pux24ZLnBWEtzgH3s6ZpNeGEneLDnMAW2pseRgNISqRyM/v0+cADRM3wrWXJvcLU32c6x8VTU4E
	iK6oME0ZjHq/EK00q9eRPyWQmMXHSbILOZuKC0g==
X-Received: by 2002:a05:6402:3218:b0:698:3fd4:47da with SMTP id
 4fb4d7f45d1cf-69a1a3af7b6mr363829a12.26.1783115495573; Fri, 03 Jul 2026
 14:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702231838.1175485-1-rosenp@gmail.com> <CAD++jLkY8AiiKyKN8FbKFRGp4i1=k6LuxE3ifcoP_MV6Vf_39Q@mail.gmail.com>
In-Reply-To: <CAD++jLkY8AiiKyKN8FbKFRGp4i1=k6LuxE3ifcoP_MV6Vf_39Q@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 3 Jul 2026 14:51:24 -0700
X-Gm-Features: AVVi8CcQ2w1DPSUWD_pg6qQOiJd8nGWONzU_mkdm9-13Swe6TlKUOA529NpzgVg
Message-ID: <CAKxU2N_cAK_tcucrTUyXNSmSVuvAnfCcbHKGuWhEnY9nf=eLQw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39436-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A109705F90

On Fri, Jul 3, 2026 at 2:01=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> nice patch!!
>
> On Fri, Jul 3, 2026 at 1:18=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> > During driver removal, devres cleans up in LIFO order. The IRQ domain
> > was created and its devm cleanup action registered after
> > devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> > chip was deregistered. If gpiod_to_irq() is called on a pin during
> > this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> > irq_create_mapping().
> >
> > Fix by moving the IRQ domain creation, devm cleanup action registration=
,
> > generic chip allocation, and chip type setup before
> > devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> > first (preventing new IRQ mappings), then the IRQ domain is removed,
> > and finally mvchip is freed.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Can someone from MVEBU test this on hardware?
> From my PoV:
I have 3 devices that use this. Tested on one. Works fine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

