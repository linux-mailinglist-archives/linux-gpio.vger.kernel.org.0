Return-Path: <linux-gpio+bounces-37657-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHZ/LS4vGWrmsAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37657-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 08:16:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52B5FDCFB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 08:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A26C3047C9E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 06:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFEB3A6B9A;
	Fri, 29 May 2026 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn/I7IHX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB33A4F5F
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 06:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780035361; cv=pass; b=h90msGL/ehvEcCmOe5holqX8u6qw1zk9WoD71RW6XocsrSFDYoy7eNOXGj/uIZ2z9S6OjQv9E5d1j1hiaGzL2wzH4feXY6iB3JlvjzUsqK+4dsYO6K9lbSfYICPkopD4m3B16zhjpE9HbzIHHDsz1sQLCiGHRNalDPhasWi/thk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780035361; c=relaxed/simple;
	bh=nVtJbvexaNJMFdME4ML9ReAWPpSNzObidFOqJ1kMjUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9g0YBfnXeIjenOukXvg4xMP0xPce7F/D2KvBQzRzffsgflT7fHogO9pc+LWidzVwF8omNrN0B32fhhSE2QfUoy8bOnbBQ97COXgz3m5O0zqodi1nDTfenPDF7+8flnvmSd1PdDrJFs6KkbaemuTpCYw9q1E8YouJUtNTdxEvaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn/I7IHX; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1370417c01cso6176473c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 23:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780035359; cv=none;
        d=google.com; s=arc-20240605;
        b=Le5LodqTkwfIvK44osSPRts3vZ7Jqr5i2nerSsC3E8m1AIW05yGbmj59mHn+V48mpG
         ENLj/6qfmV88V8dWKyK7yxTrd0C99gkZVTB8wP9co+oRiolYTErPp3ypt8KUbGCA4Tqf
         fyquWKWl61sOoy5r7oa+kfeOBjX4mavbt0opGLRQBRIxFi/dI914zgXodwEsuBJWTomz
         m45pDgmDbPItUVXUV8PoQMOW/LGgIs9AMQShd7cqFGp48bf8J7XkWltKzC0enWF5sLuv
         HNfaKGa/XFBoORbMHKJWROgoHwD47MCFsuQvzYhjQH8JAotFBmSedE0EKNT6tMwthdYb
         8AVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOQjI2j+Vie6aL7ugRBd46imNc3/KLfgc8m5NZycQNo=;
        fh=qOjJ6gGtyfvgNu5VcRDP41JNixsaAPS2ov/D4ZSsuiQ=;
        b=AUZ3D4qrftzH/0EWew0QLq78OGxY5Cgc1/NJ/QaphhlZemQZoCyeU2uWSxjm0a5IyH
         evdmXPWoN0hYlr563VCkPYzFzr/hY2yycXIXPESGD5OWB5CkNfoCtOIXEVqfabX+Uqhq
         6bELYYicwZBCBDkEIJgSmUKFxkK8/tZeyXlgpuFfvXwJgzk7osVS6e5RCgYkNV2Pzpb0
         8eFrJCIF3jDsWw2iayfPXxaTlk8+tvCKpZKsKLw64goGhJkOiiqq+dLPc2He3tzaqYb2
         h5sn3r02BawxMl2wzPjEnou6WWfDUg7fCku1/NHsuCRVjU2Atv6g5Bwgvb97oTvGRhVz
         mDkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780035359; x=1780640159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOQjI2j+Vie6aL7ugRBd46imNc3/KLfgc8m5NZycQNo=;
        b=Jn/I7IHXr+l+iFKKLtTmJX1Y0/xhi0aMyeHQk7sF2f/cFnVFH66nTL7kdcyCne8uEQ
         WGdVTE2pRd/xAR1UYyVOQIZnYbU50W/waQYgH+QWNPtJJ+Fp7AL3rt90GtibcPetrNpi
         VcqkXoDj3wXbiodYQlYXWk62sRfnT8ag87n6qYDEyOt4cu3Ix/A2csvq6TGANvjWlcK+
         B47Gjgp8uady+YV1I1aLENZvDvJ+BH+QPkXX6kZv6eCILZTxkRGsqBS1NYLRAd2lSIY+
         AJBiBx9dEdepArEsFzZ6O7QwaxZXfqXxjMUNnjwYOjFkfpHoYg/6hL0Hng2uDc9+wNBL
         m9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780035359; x=1780640159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOQjI2j+Vie6aL7ugRBd46imNc3/KLfgc8m5NZycQNo=;
        b=T+u0Eo6jPVayvsr2/pY1zjyurBgQdH8+r2gf1gwrzi9G/ntpaAUIYs6c4hoyso8+yD
         5GkeFYQRE/PYGNyBj0VMtBXqnhwUyEukXXuhePcdndezLiLGVNIuMnuFHpUCLbmQU/vE
         cn5rbRovqeR2TAirxaDVzGixjdWqPrxrgai1mFYLG4pCvEcZJLtJh9vZPaRnfsWgmxy0
         dV+DsBLOYPs55OFtYnpiEh+fnFbODrJ3pqHMvvrQ9nDVaqZl2qZGKLBGQobrjZ5JODgd
         ZyU//Eyma9pzjp8GD15wt6kFirZ7jQLTi6rRQ0FW1rtfZI/JK+6Fa+0sNwnUisN4Ro0f
         sI1w==
X-Forwarded-Encrypted: i=1; AFNElJ9s5+8ebmLLq3wKW535MLQuWJ4rtbx+92fvj41Np+rOPrjNPtwQdktHwchNf56+c7VDgcPGRmv2AtyP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5a7OHAfekz526+Q1uiP1RrJPkdVgOtBULi189CQoM4eMn9ma2
	rXqGARphIhSReux1QxBi0q05oVAStmGlDku/uAhzY6QFzPKdLVyiK85+wSOYhB+6AOKNh359560
	pkMy/4KeCe21imXbjq6sVjzFMnx2C36g=
X-Gm-Gg: Acq92OEl1y1Qqtec3Xg6F+jJFjWVGZkVQKJkLa0vdrsXHmz5rDScej0Uc95RXin/qzZ
	zt5o1dvYQhSjEEyLBBz5Q02cyq6rskKXMf1wCdyLPSOD4VYc6lz1zhUTL2/eheJRtxI1t78CeQu
	81zKZhSqGfdwYKeNrSZjkNdQo7X4ty9lNiwJxazBjkp0lQ/DEvuWCmcgVYgApaNEPnN5hjZnqsT
	eL5c9NqhiMwoP2ljNBgT9jKrd+It9ToiOBselTVejT5OKTkfHv37F4MfSJxf+As+Z6Uk6kS4kcj
	rwddeUz6CPDER7Y8AKOkVKbbog==
X-Received: by 2002:a05:7022:407:b0:136:7d65:4edc with SMTP id
 a92af1059eb24-137aeb9217emr657397c88.8.1780035358982; Thu, 28 May 2026
 23:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526131243.2160348-1-sergio.paracuellos@gmail.com> <CAMRc=Mc5bj05ThOMy7eguS9+tPHkevWc3ArYzcQqvB6SrXpO4w@mail.gmail.com>
In-Reply-To: <CAMRc=Mc5bj05ThOMy7eguS9+tPHkevWc3ArYzcQqvB6SrXpO4w@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 29 May 2026 08:15:50 +0200
X-Gm-Features: AVHnY4INl8B5Huw6Y9j7xwxi0vhZc_R5n6PiaCVEDmV7v6475mKIlBxtqptUy2Y
Message-ID: <CAMhs-H-YK=2CGDnfBUso1Zov4uV0DKso=HkgctosL4prDMDZbQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, tglx@kernel.org, grant.likely@secretlab.ca, 
	anna-maria@linutronix.de, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37657-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5A52B5FDCFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

Thanks for reviewing!

On Wed, May 27, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Tue, 26 May 2026 15:12:43 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> >
> > Device tree is using two cells for this, so only the interrupt pin and =
the
> > interrupt type are described there. Changing to have three cells to set=
up
> > also the bank and implement 'of_node_instance_match()' would also work =
but
> > this would be an ABI breakage and also a bit incoherent since gpios its=
elf
> > are also using two cells and properly mapped in desired bank using thro=
ugh
> > its pin number on 'of_xlate()'.
> >
> > That said, the solution adopted here is registering register a linear I=
RQ
>
> s/registering register/registering/ but better just use imperative tone:
> "Register a linear IRQ..."

Understood.

>
> ...
>
> >       for (i =3D 0; i < MTK_BANK_CNT; i++) {
> > @@ -331,7 +466,17 @@ mediatek_gpio_probe(struct platform_device *pdev)
> >                       return ret;
> >       }
> >
> > +     if (mtk->gpio_irq > 0) {
> > +             ret =3D mt7621_gpio_irq_setup(pdev, mtk);
> > +             if (ret)
> > +                     goto fail;
> > +     }
> > +
> >       return 0;
> > +
> > +fail:
> > +     mt7621_gpio_remove(pdev);
>
> Don't you need to undo this in remove path as well?

Yes, you are correct. I will add this for v2.

>
> The approach looks sane to me. I'll give some time for tglx or linusw to
> respond before queueing it for fixes.

Thanks, I am going to wait until next week and if no more comments
come I will send v2 with the commit message fixed and the remove stuff
added so you can enqueue that for fixes.

>
> Bart

Thanks,
    Sergio Paracuellos

