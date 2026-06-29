Return-Path: <linux-gpio+bounces-39161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OPb3LKTBQmq/AgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 21:04:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1976DE325
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 21:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dRyQAicP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39161-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39161-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27333037F46
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2B2DB788;
	Mon, 29 Jun 2026 19:03:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE461DD525
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 19:03:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782759819; cv=pass; b=JAeZwhfnMkX213SjWe5NoymISM2f8LySK3VTKIK72k1WnG4+hiqmYSXYbf37Vx/i49WMjtOfuLRoSGsnKjhEkESN7I4zzZjhVqCOxbKAWpTg9DkccTZGJb09qMiqwBI5EXO/LmUzYx4DaopDReKZ7XelRz/dNJfRK4Go4nKdUSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782759819; c=relaxed/simple;
	bh=O7HTlsEupO97RO6f/CU//rQ+5J1/gaDcvxXYrGsHiZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmzuAcc0xzLHOobkvYTS8u2oTYwQCff65R7etA5uko0sZExWxbjeQ/94mDpnjm3PIWFAf3B1uFzS2VH2YT4kbtvZRhsL4nb+FNJkZf3yrt006I9QVDW9sonstEn285E1K3NKAixfuTNfydbJbayp8+ve3sqs03x9Zq+Cuv/FF5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRyQAicP; arc=pass smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1298347f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 12:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782759817; cv=none;
        d=google.com; s=arc-20260327;
        b=kDzzPmuui6hZ+BsX9WDRMROrBCaBA8b2bRE6Sa4Pw7F0eIQFL+2D7q32Hat3kqx3Oh
         3OmqcR2aIEM10Z/vIJB+czT2qJfbLmXb7Bi4wYO7xKQgfXKTB/PnY/hmgAuhQqQEopUk
         GvMU4snfWlC2SInaGkDAFPLxYkYBfIrgp28zW1+7/pIWJN/kGpY4HWOtip2OWsZrzxbb
         NrzQEoTWTh8WrBYRfIdLxLya4o7F+OCJGjgo+YGmvK0gZR9tLu5HoY8f05HYuxr26IPA
         t74Dlr3OAlPzLG5g1PYhJYfiA12HeJ2f1EeIIGZ/+oDSb+9+G6D4d/PeKYCsTJNtXiFu
         VFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7HTlsEupO97RO6f/CU//rQ+5J1/gaDcvxXYrGsHiZc=;
        fh=/XnNVSh5/P58VjpIoroWrlaPdc36WYODQZAu9YDmLCc=;
        b=TQfBYtq0U3K5GThJRK2ZS0MwwAXZXosgHsgQ84PhExq3Vr8+RdN2R01YMCmMHGWIr7
         kxtnBmDyMAkz46BbvBeCpdTvOqW+v2pD1J12h3YeXLByVGdkyztv1XgFkrir89OGR5Zq
         jRIahY4GTyLJL3smK/bawUfCmV6lLIFICwXEK8WIMh4I6Q0Sg8+jaR4jlYusgOyoRhkw
         WZSQbWHIzrG7qVcbW3gh2wU08t0iEW5CjiJzmCHuWcM8nLpnUWBMWvoNVl58+L+oRK+1
         fbxG+0pf80Ue/4AJa3yVeSXWpLSDmJ38eBKMkCtX2W0ibWX5/lgebGb9a1/OKU/VAurW
         NMfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782759817; x=1783364617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7HTlsEupO97RO6f/CU//rQ+5J1/gaDcvxXYrGsHiZc=;
        b=dRyQAicP14VFdqRNKyYTygbNaFHBlRseJOP4ne1ajASGMTqMhJgj3wpif2eHalQFUZ
         RW5cxLx8+gpA+Hkbu46zsc7mp+oy/VFtTv26GcuNhPCHFHrFiIW4nA72b79EdR1ZJjiW
         Ze7ii+kYu83r7Bgm6Ri+rgT0lIbr23WRvJ5NrDrFTRhkq+NDRuLXXITTDgkBacOJ3QrR
         +sPkv1Z+EKI0k1vGaq8wBNEkMV6aRktqPf9DLR+OQ1PRg56Z2zjyMfCobHHbIgbNV0dE
         9SxHj+/74AUlzaSg87xAoXw0JvED/qVEVk9RKC9kBR2FMhC+Bke0Xm7t/gLliqlurc66
         ZZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759817; x=1783364617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7HTlsEupO97RO6f/CU//rQ+5J1/gaDcvxXYrGsHiZc=;
        b=Y7v8S9Ss6/ZS9inpwwUGZyCClv1gY7Se06TR6s/XaEifstFXnOR6nYYDJnFztLvYkR
         yVnECyGUuPKOPZGRbLmiCm5q8uPEzcKgDV8Nx5CFkqGQ+qE5TD7dWuZoROvJKqIHfdV0
         I5loVrJCFC7kjA5vniGSDTp9aZByI2FHhTPqy3LZTTgFtsH+cE94+9XOnRx+EkSoOVuv
         cNSfvIVqP+Ai6JVc7sFXqOylDmDlFmW1xJCY1AZGnGw5o5igheHAeHIaxZuEx/v26HAI
         Z9tDd1Sry4OqSfKV/71YtbALCzhpRQidjOUYdva738pA37FnxFK52YvQ07OJw3kC/xM2
         AHvg==
X-Forwarded-Encrypted: i=1; AHgh+RreucRMSZNdxrktyk10DLaRwHDiSVd4drkApUOePUwbseREvsMI/6VFedV/6OJ8EHKMTYAudTMDc4ga@vger.kernel.org
X-Gm-Message-State: AOJu0Yzood+TRpR7v2faqOqaQDi77yCIdq83OFWz1L3Vi0pZe501LcV1
	1MS7uZkaaJuIOz/7/8Xz/U7D9JOL3VKKf7I8Hxk7vxrhHQ71VmY5UtsyAOhcCrKrMziop6JqjK5
	XkZgNXU7Q0OywD8F2HY+q/s7qMyg2ysQ=
X-Gm-Gg: AfdE7cnuNw3hK2BgONUKKkjvymx9rcth0i9x8cLwgTxwIMe3oPf9yLD2gnjl3E7/FTT
	kGbHgbxkVOEQDkxd0yUCJAWqW2gVIh27A3Lt2wQfK+cGnRkMbqaCAfQw+NlGXCF44Y+LLfQh3+l
	oxpXe5Qkj8S4WBNwfggkkPBfT1ysNYg30gKJnCTm5K3egg/h2G3BtoAWeiz4pS03rfGwpqFY9F+
	/D4SufGyyWNKRvqTwqNlhmwL27AFRud/HVewL+XFH518DukNJz0Kp2mtd7zh945CP9mn0fo75E=
X-Received: by 2002:a05:6000:460d:b0:472:3090:d878 with SMTP id
 ffacd0b85a97d-475507ddd88mr593889f8f.4.1782759816417; Mon, 29 Jun 2026
 12:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <ailxCrCYXPkrKqi-@ashevche-desk.local> <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
 <aircdlL323BTioZE@ashevche-desk.local> <CANYHO6rUVm=6WQSemJhMoVV5owPAL=4Nw4cFxULaKmq3fG36=A@mail.gmail.com>
 <akKt4PV5E6lYpEZV@ashevche-desk.local>
In-Reply-To: <akKt4PV5E6lYpEZV@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Tue, 30 Jun 2026 03:03:24 +0800
X-Gm-Features: AVVi8Ce0LYq9P3dCZqT3n6PoEqrFUjR7Ubuzh_tjJh1FPMmgCqkiEpGYKJKh7tE
Message-ID: <CANYHO6pWjX=0d9ZoJo68dc48uoDUp9RoKGvqB4FL84Kcjuatgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-39161-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B1976DE325

On Tue, Jun 30, 2026 at 1:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Jun 12, 2026 at 01:05:35AM +0800, GaryWang wrote:
> > On Fri, Jun 12, 2026 at 12:04=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Jun 11, 2026 at 02:30:00PM +0200, Linus Walleij wrote:
> > > > On Wed, Jun 10, 2026 at 4:13=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:
>
> ...
>
> > > > > I can take both via Intel pin control tree, just waiting for Mika=
's and Linus' acks.
> > > > > Then I can send PR to Linus to (try to) include this to v7.2-rc2 =
as it seems close
> > > > > enough to the category of adding new HW support without breaking =
anything else.
> > > >
> > > > Excellent, thanks.
> > > > Acked-by: Linus Walleij< linusw@kernel.org>
> > >
> > > Thanks! I consider that for both patches. Gary, please send a v2 with=
 all tags
> > > and elaborated commit messages and cover letter to address Mika's que=
stions and
> > > concerns.
>
> > yeah, no problem to send patch V2 ASAP.
>
> Did I miss v2? If not, now is a good time for it.
no, I am preparing V3 to fix n series processor and based on 7.2-rc1,
I'll send it after 2 days, thanks.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

