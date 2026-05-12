Return-Path: <linux-gpio+bounces-36629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNUSJOFxAmowtAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 02:18:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B3517CFC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 02:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B364301DE2D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 00:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A556A1F3BAC;
	Tue, 12 May 2026 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwmd+wPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39462347C7
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778545071; cv=pass; b=K2Xeap9wknhgcnxG2pY8W5h5O4+6BqMZ2scbcDnoyFG+dK6CdC4RImnNY4BA8BdVxUR7BZoZcJjDItg4TR+vuGrKD8iCbBq21ywDnt0/Y+3Q1Cco31trKwtJVfoA28RdOsdgahINL80NnnH9iWfkCBWQLxvwiyMO9ZNB9b1CrEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778545071; c=relaxed/simple;
	bh=ByNXg57yqptsZ0LImiNLjiav9kRhoeUJ7pSIbjyY9rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVdjZWlKjSVjlRzRUOvmlidQx/Utsj7KyBYUa8s1SwH3Tn1OzKnyGYkVJTpaJCjy9g3G/YFjRI1f7cFh8CWuDCibHjwiuty2H/seqGNak5rTEMZ6W7hIr+zlIsbGXrpQrRjGpW6vvmeE4Oj0WLB67lfT/M5mFN7LchkdxzxZ6rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwmd+wPn; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95cc8ac98bfso1097197241.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 17:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778545069; cv=none;
        d=google.com; s=arc-20240605;
        b=lXlEOOZfABGS5vwha1SZp3rZ6kobSsSwWdCVhTI6CyFtigOZKV4wGD7/4OwjU2hTvb
         GVdAtiX3OFpwPjaKrWoA5Y/uO53dhiMr52ic/UADpPtbfyTwtoGp5B+s1Chtq1cHly9G
         T7GjVelRjWsBDr3cEKAEOzQvfH5iyWtiLwJbWlk3fKfEwrid+XTcgV3vmdWx+i+58cpb
         EFflMKv2Q6sOJfJUSSXD0Q418qKSVpPQvc5em5x+DOHN+jQQZU+sY9xXavJls6fZqyCZ
         M0c4J/7gJTKhii/MSKLJhZZgSe4lkQ/UXb1qo3jwJVBfUd9DdyDoyNliuPANWcW40o+h
         A6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+CGuAppBmLCYM31uDj4YkSAp0AOcFGT6Lx5/e7GHwg=;
        fh=3MQHPi4dyc5Fhv72JJDCfx+MLgmXEWCRAwwaiFRS/Rw=;
        b=dXC7H+fi/1h94wVHL1BWuEIkLrsF0u3bz/OTTBrNaasUZpDu1YUejo3CyhXXVsqCV1
         xSN43O/31QrR21WLKRfihJU8d6iH++toWLhvPNNWZ8aiFhpY7rUKW6gDZA7BHj+qETTG
         SmrCXt3KIUn2WoumqobZFUb7ueQ6Hra95rhPOuTwEE0QKzEE3f5F5xC7YMxxozETOBqy
         HVI3ly/0kb+ErYI5ymMwg+I2vQLKl+0Uir2252bW1ArnYqrm/DBAXj5ylFQDpeMj6DN7
         V2cymPsrbtS4c1kxebaz2JV9ZlihpR2cltphZ/R0nNElOqUh+FzNLTFXW3JMeakqDxt8
         KBUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778545069; x=1779149869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+CGuAppBmLCYM31uDj4YkSAp0AOcFGT6Lx5/e7GHwg=;
        b=rwmd+wPnh0O/w9AyWlyi7AAyvNi+zlFa6nAPV+SstQZyLtcJiY/j+MMNBu71J7X9JD
         vL0Q5zKB5cb04ktaFdCN82E850Mxnijq0UfCojz74jqRALoM8ZqF4KqeYXH+AH7xBLUm
         NeFXd2SEEfPg99Lk/SAL2VmLYVUwSx4TMVBsuc7eaK/Mk/X7Ch+/Cb3GPeN81Ly1rzF0
         nUiEpE1wdiWnC81QviN+KWZsaptNyt4kpuNQ53aLjX24AMSdGpiTCI0f0q3j52K+5cib
         1H0IwPChaqJHMTINATNE25awCHerPQiBo+3+PBDYwo2lPxPzs3sLm4JWBNAc8fvx8YOc
         0+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778545069; x=1779149869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+CGuAppBmLCYM31uDj4YkSAp0AOcFGT6Lx5/e7GHwg=;
        b=CTceK54+TnPrpNOkkLsQQ3Ep7YOCkwi7uk17VJAbtDHYraCnddyJSyof0wW6rhh/5m
         LRhNj06CTwtLglffx+l3S32q4oLrJikg5y224DvqrUbwEvFm8arTkMVvdJ8pBZ0kWBHc
         WiJH0v02V9AVlw664jd95MLYT8askKucIrgWT4KBRB2rUSoBIhSu7/cgHTEBNhIWnllN
         mLXAG80C0g3ga1TP25TXClevdzytyT4DD8DnhRnJzTHyaxasSLYXsGzyjeb1rCZOvZfM
         gnrIoYEORZOyqdaYs/MRghhAGazILGj4yEQhYqRlyKyedSLB3tGmcA9STp4TCcN4i4Us
         kS2A==
X-Forwarded-Encrypted: i=1; AFNElJ+G+Pe4hoED25YlJ2eN/Ukm11MIJemV0E6GVcB/DtJlUui48GnIVSqWC655Ci0C0UKDde4zBcMwnlGS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QMXj9kP+YaZL6f9/M/FKJmIhw0xo+Iap67mvnAsNsQ3CpvGg
	8EScxkzvuju211x6l/QThJ52uQQcWDKvITyTqqHwTixT2X8qp02hPBTB2dBykfSZ2HSSXSjTjLP
	PdNglFhsBuywXj8cSBY2Cb5/7ewbM5ag=
X-Gm-Gg: Acq92OHUm5xXw+7ZnMa71aZuZ4Cn72FLVpPaDJhCn+NUXZEeYC8qwg2Zzv2KML9ngdu
	vIgdU1tDhnJv5VV8oTvLeJI7U7Z9P3a/F6IJFDzuBiRP7Mfz5kkKeYDq9tgztimsNnUojtm6XDy
	ULZH1chtjPGVh8+ctz07HlVc668USQZYaAGSnXjiuRzoQ0LHXO0gB5iG3V9F9CtJf3rPWDvT8aB
	vyRYXgRc+Mn8ew2Fu6ahbvfsPDae1z2gWC/MAoVbb1V2NDNedohuQQY1DILJ1fuZja/j9iI1nqQ
	HrSZotCio7eX3VC9b6zDkaZTUn755Sxfu7xGwN4=
X-Received: by 2002:a05:6102:291e:b0:631:26f6:701a with SMTP id
 ada2fe7eead31-636180c65bbmr289537137.29.1778545069032; Mon, 11 May 2026
 17:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
 <87lddyx7gg.ffs@tglx> <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
 <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com>
 <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com>
 <CAAMcf8BJkidsyuFQwsuO5A8iujXVgM=NkHka0eD4es4X4uUCfg@mail.gmail.com>
 <CAMhs-H9+BfWWpaEP6UCpQvcSSzphGPre2GB0CeLfoPn9ePVwuA@mail.gmail.com>
 <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com> <CAMhs-H-bU45vhV4XhBEmxV+6Yo2AmcMo55P=mRJ9ikKB5CRVhg@mail.gmail.com>
In-Reply-To: <CAMhs-H-bU45vhV4XhBEmxV+6Yo2AmcMo55P=mRJ9ikKB5CRVhg@mail.gmail.com>
From: Vicente Bergas <vicencb@gmail.com>
Date: Tue, 12 May 2026 02:17:36 +0200
X-Gm-Features: AVHnY4KSLlzvTd1SALZ9ku9ZFf5SpPFjZxAbzKC32HpK8CVWKo-yGJxHq7cL1Cs
Message-ID: <CAAMcf8CXUCOOhtSGJs1QLCGZ4JgeJtp3MMRErnJJyXnOZ8y46w@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0F8B3517CFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36629-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 12:52=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Thu, May 7, 2026 at 10:54=E2=80=AFAM Linus Walleij <linusw@kernel.org>=
 wrote:
> >
> > On Thu, May 7, 2026 at 6:06=E2=80=AFAM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >
> > > Linus, Bartosz, any advice regarding this?
> >
> > I sent the advice to try to use an external irqdomain already?
>
> True. Sorry, I missed that somehow.
>
> Best regards,
>    Sergio Paracuellos

Please, can somebody write some general guidelines on how to use an
external irqdomain?
I'm lost here, i don't know where to start.

