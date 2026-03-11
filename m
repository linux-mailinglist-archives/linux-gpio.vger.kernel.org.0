Return-Path: <linux-gpio+bounces-33142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKh9BJt4sWk2vgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:13:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4262652D1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48887301ECC6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75CA36C0D6;
	Wed, 11 Mar 2026 14:13:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00883382E1
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238423; cv=none; b=tSA43xASCq9pAkUILPIxYFSjqzAU5L53cpBtu1oTyGiAoMXRIUiD4KqGVenfKztjiVV9Gnw79cKQYRSX8z9tEGEPWwYhC0JpnfBNAEXfuRpMSBRUwzQ3RJwNzy2gCAFJBueIYWd+MzQBsYfSzEebzvfNgqCrdISkNRTvWwfDf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238423; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnEGET2TxXgeIxWBQx1IzSUAzxm4yzoUZiwwsBwGTisojh+xTy0buWBjEdxAhUZnaKXmr8wjtg2TzOrJbSmWhY+yb/dLmh7olBhpO3zZA0hulO9/4RuaPLswBKT08Mlx8RmVfVLPoGKdke/P/zrQR+/FVHFzdO62j13ecOZcBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9423d62cbbso151405466b.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238419; x=1773843219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=Sq+vp8shQvC+g890pCi/EZMMfQgOK5gtqvnUZ6u7OCbHB2fMo5VGTmEWuQ6117qf8f
         6qPrVyHBMNQ9kilHc7eS07rTznOUTQ19K10jpU/taSPohp7LJYd3eBHgvfMGNgBDrLRt
         a2FziU90ahYOY3Pw/orDs7pH9TG0pPDDzBSUCcz+pMlWuuK3p0vnJQ06CC3dOD8vENE/
         ESBHKWmoh6JtMunZ44hOBmaQf+QR1yLhyj1GzSZ3H1I98EhE9IbFiUa7a3f8H54eMq0/
         iRn/XQRUWq3slicho6RtzKLunHY/r6Fglqauhq07Jk691b8tdvrRxpttg5gI+dfFcMGY
         k8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVczGPOEaUgwozJcBYEFTNvs1U3/zwRU/BB1xIKoHgQEsLWkYT+chLkQPDzde0BP0XyAGHWiUV8s6Fs@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtoYGZlunKM+D8b+9KLGW2AH4J1aWxe4X9/hIhxOyL7D/8APj
	7z2eDtKadk4SbCphVfyKtWFWQ6SRhaXQvGplFUxidYoaV0dmyjCH2DhuZ683lj+tVQ+fyg==
X-Gm-Gg: ATEYQzwFqSfTjDKgAcLT4527Uum9Vf9RqIke85/VmDh38+Q6Bw+CaJ4RlPM9XLewKew
	y1y7FVeqG5vYOmbFKC8VVBAOh1HVyyMMiXLE+Q3C+NvFb2QmxmuOLoxdZME4FOUlOczEokGj0iJ
	d+rW1Pq/XqMnX7AodxImrTgz8KlThdeILLGlasjza9CTFxyxz96zCNvg5SvkfE/DvlDSRReU7PA
	zX6ZN9xs5F09Mu0eTcDASZwB5MCkFZ7U8fVt4Yj/HKXicAFOUPYlAFbhXULCCqfGpQawHJiuHGy
	Oy+RWMYohGHVNKIZZmhccdIpIQOIaumt89AXjpwFUXNJU8J8x1n5Mv7WpawLpTPpWv5VUdx2fpH
	EkIKQG9cggwbIjvDvh8WE9kGmug0GYIP1kmBtYISxmbxlsupbQDDkQYg12x+YEgt6XBRv9e6Ctt
	tcQ27KdGKMOfdySkzJS7QtlMKeBJPWXcJi3pK4ZD6NvqMOX504mDXUxzG+cgTYHIo605YOO7c=
X-Received: by 2002:a17:906:2081:b0:b97:34e7:ea69 with SMTP id a640c23a62f3a-b9734e837e3mr67272466b.16.1773238418660;
        Wed, 11 Mar 2026 07:13:38 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e18e435sm60471066b.53.2026.03.11.07.13.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:13:38 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b942b36de08so190744266b.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgwKHlPJ+GalBlLEKpw2VlTEMY/Dk4jqgEjs219pojLRaqHywr5Q7mXDpGboa/znM2sVIvN5XImqqU@vger.kernel.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8B4262652D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33142-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,goodmis.org:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

