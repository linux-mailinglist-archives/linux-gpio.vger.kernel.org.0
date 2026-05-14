Return-Path: <linux-gpio+bounces-36839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFWqBWC5BWpZaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:00:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0654150C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA6BA303DD60
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1720338BF62;
	Thu, 14 May 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7EpcHBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25AA1FCFFC
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760028; cv=pass; b=eNi1wWencQ6yVbPFlVorPE9MSiaTu1A2BLA3SdujmJA52ZARUxZK8zszf7l2uu7NJA8ZQ1CcbwjqjYOVodGlzudDDFJ2SFWccwSHLB/7tOK1XTBf5L+V4qlFJxQ5hqRPaOefrzYSVg5tDY08W/eYOq229B4UtEi2nIxD0u+nsZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760028; c=relaxed/simple;
	bh=eJWQezTgG2yPbkrKetOwCJtPt52Utl9ZLEN8vUnsAJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCUnJJOGmSTzvz6vH7nc2Z/ySUPGqeDNHdoQuwnrtLIKfJfw8M4AP+uXaoPJxXYOvNvugjDQowkFme7CcBPrTjfx66Z+SlC5tsEqHTF/sAaIb0jqWMUW/At5jSQgXK2GDjaV1w/rvXvwKQhQECrqUKWo5odIrTExVWB+PF5MH6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7EpcHBo; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-132c338a537so3614120c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 05:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778760027; cv=none;
        d=google.com; s=arc-20240605;
        b=Of/Y2oWwRqRavzREwb7JTSPFi6Q36wN+HFiZvEgrLCXjV/gwFECXRRbLuiL/cKk087
         /ArqLbH1NZ3p9zI/SQ9xYgJkD3nUrpLVXNOgLOxpyne332VZlQf6IEq/a1j2nikLax14
         AwMYrcG0HyoZ99UAElBus4Gn+8KRgkxurpCZLMKLiYTyRSWsyuuerR3Vs9ao7ZBKOwX2
         udtN2e/MV1CGyY2nSjdSTb3jXCApobVbyEEeRzJ9irfuB0Xy9atyT1vl4jQ9pcppZyZt
         UgqOwKvFVLxLFvmn0by2IfdT1RuyvZDjgbNQhwQcSQGjsjhSZJeDV/CaLqVt0SEqLdEF
         aANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7VRpa24AvA61ON/f10wNgLXTZHs31blDdOm6dTpOS0=;
        fh=+h/FPb17Tzgkp2cKkBTJCKj61FV6TX/lwpoxlTpyJos=;
        b=ijVEcadjRtJcd3MTgt/cSKujTMDnK+csHp9ICJShdJ0ndFXKfYWJFasMu0eEKos+EC
         b+oct647lkExs7aoBHFFZ6++IzCQYvbpDhFgxQl+yaAuqoGzI6mYejczReBs/3l7G/pW
         ZOsB7ZHWgBOFdcBK1mqsd4mIQeSDmq5GCGVnf2eTfNVraVZ/tFBJhH6YU3tEM4XpKLsi
         w38agl6mdcpuXaQxFEavH4WIQHAheDstgReoC2w4fqq20a5hyw2kMd0NlG/8k1z23/34
         kc3EcrsnPf9X+VEreVPtpksG9+8xdqNMdLMIxuq4uyCvtgt1XFmhjrLFtv6hO6DB5gyQ
         iwYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760027; x=1779364827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7VRpa24AvA61ON/f10wNgLXTZHs31blDdOm6dTpOS0=;
        b=f7EpcHBoGcd3LbzvYgLLRjNZypzB+4TGJs5rjCwQBfKG38YPxpMA8r2lyfs2m7FgW+
         rX55IP1UcxLVHo5Wxt/BTmuiuyAGST52KKv0Fx72jfvAjJbdM0Sn6tddvGrGBljMlkMX
         HtuhjQeW1LUwwvHM60/6LTFfQB9ADaauO/pVQUrIHzmGBfaM5IH4ymzV14OABtbvY347
         AwY7OU4E9EPKjPmvN1Sli4+Zy0EHNFllfGPSR+tywbd4Dfv2xstyBHvx6a+IaTVC0tk9
         pXYEjCYnkVMQwIBFdE4QZvmDE+5DFlTqHI+5g0xVJKlBP2xu2U6NYWfMB/BH5YO13OH7
         F1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760027; x=1779364827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7VRpa24AvA61ON/f10wNgLXTZHs31blDdOm6dTpOS0=;
        b=Au3xkzp4GdIDeNL/PFDYU78SYegtU8zmCkqWP21CI04FCWHN83FpJD5kPyIdG9TSJa
         NFxBbhtw8qUGA86/N4utRnqNcgBaK6C3NgtFEAonKGMHJ7a8oTX/CHXxmHTpVKet3b87
         VTTYgcduuI8Ub4XzdalzmruC6jgF7feZ65gRbtKljf2u0n2LzQWWus0EzvIwxmVkKVlG
         a0DoLsNs5C31GFjYKG8inKlNrwhUoDpCUjqYxhFF2uN2r6qiHoMX7c6rTuCS5xsw9d5C
         2J3DkyPe8XKb9naETTu4RvnReO5JVUwe3yIgpU3iiYSUH8cFQqeDIVJjzuj0MYGjO6je
         Ys4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DwlnbzAQuTfq4ORT8roU7vO3v8I5aHh27V71luZ62CVFceNLGaB9Yz68E9LcX9FiTvvULpLy9zGv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5IBVUNmwt/+awBqn3YiFPTVL5xbyHJexDwQ5y8ODSLV6/IIt
	WjndNjH5pSyIRyVilClfRyKa1OokYa2nYFTBF1+qdzL6e0WEJVfvU0LKeGlB0+BhPkC+3vRxcVu
	rbEeSTA6FnIFJh7gLwx+mVew+xL+DuzMuog==
X-Gm-Gg: Acq92OGdHDQoRP5tDEvm9JYc/UUgYmKTkKhSae8ciV4dyhF3qRU+1Jjwz36QJBwNjZH
	2p5QmH+b7+ZfGqJVPCeA4IcIv9zY7xb7J2dBhRxevguDsh9s8FDi1PvaDr68i4E52qHstEmAMNz
	g7ao1cR/WYjB8luHceIz+SsXhBq90QN/7FKIG9b70XZgPYmYYDJ/DWikTV2YrbA1gZCCcW8V3RC
	QRzX/WWhzJGQtA7JnAEXVRUajY4riMfJQ17RqElY3V2BJzuU/YVTJFlAiKgEFwZoc9rvNOPuhIs
	e7Bv
X-Received: by 2002:a05:7022:393:b0:12c:839:7462 with SMTP id
 a92af1059eb24-134c8c3704emr2230544c88.12.1778760026297; Thu, 14 May 2026
 05:00:26 -0700 (PDT)
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
 <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com>
 <CAMhs-H-bU45vhV4XhBEmxV+6Yo2AmcMo55P=mRJ9ikKB5CRVhg@mail.gmail.com> <CAAMcf8CXUCOOhtSGJs1QLCGZ4JgeJtp3MMRErnJJyXnOZ8y46w@mail.gmail.com>
In-Reply-To: <CAAMcf8CXUCOOhtSGJs1QLCGZ4JgeJtp3MMRErnJJyXnOZ8y46w@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 14 May 2026 14:00:13 +0200
X-Gm-Features: AVHnY4L0QGyUknFLTO2w35IwiKX6NauIGZokT_Cr6ryhuHPzPKO7_vzk0CKxZjE
Message-ID: <CAMhs-H-dHfQeMxmQYOpVS-tnj++nX5_mNKcu1xot3SQETyh4Xg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Vicente Bergas <vicencb@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6FC0654150C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36839-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 2:17=E2=80=AFAM Vicente Bergas <vicencb@gmail.com> =
wrote:
>
> On Thu, May 7, 2026 at 12:52=E2=80=AFPM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > On Thu, May 7, 2026 at 10:54=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> > >
> > > On Thu, May 7, 2026 at 6:06=E2=80=AFAM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > > Linus, Bartosz, any advice regarding this?
> > >
> > > I sent the advice to try to use an external irqdomain already?
> >
> > True. Sorry, I missed that somehow.
> >
> > Best regards,
> >    Sergio Paracuellos
>
> Please, can somebody write some general guidelines on how to use an
> external irqdomain?
> I'm lost here, i don't know where to start.

IIUC we need to register an external irq_domain for the 96 pins that
the three banks (32 gpios each) can reference. Current driver has
three gpio_chip instances but we will have one external domain now so
I don't know but we would need probably a specific xlate function so
when the device tree asks for a gpio on whatever bank the driver maps
the correct offset in the external domain. The other tricky part would
be the irq handler itself that now has to iterate the three banks to
trigger the proper virtual IRQ.

Linus, is my understanding correct?

Thanks,
    Sergio Paracuellos

