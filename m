Return-Path: <linux-gpio+bounces-36364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAv8M9pv/GknQAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 12:56:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9B4E718B
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 12:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562E0304351E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 10:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A7372B32;
	Thu,  7 May 2026 10:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO+zmxmo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0F313558
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151153; cv=pass; b=tL8REYuN8LszIVZmaUBH3knVJ51dzJFggHSlJj1105karhu1wve3ude7yfBL1dSQCWtatkSrmfiLQgK456/fXLtQSokyGWgV47SxNqkbhrSafkIBjf537Zgp+Hay/nbqjTbiUeK+OH1XZfTA/Ti2c8su/UcG6E83O/fMCF4S/3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151153; c=relaxed/simple;
	bh=YNNeAsfs7JcoYjxby1YcE2mmZW7lwHPCmh5QFkWkICc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnnqUBjt2OP/LHUnJvy92S7Q4YjTWmQDHI8y8+kmrLKrU2iwFCpLlZMuYXVOR27tZrcMkj7+kjp7Ukiy13UBOBca/kajv4dsxmeBpYHN9xHclkfktL7WGiNsI415TSsDTFF4cBlhIjQxVM8NqcItaUKtC4RtPHRPgXu2BOo8YtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO+zmxmo; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12db2e415a7so483666c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 03:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151149; cv=none;
        d=google.com; s=arc-20240605;
        b=lfaJZ0BdjNSerQX9PB7gfoQzLZEQc4veGycTIPVoHSFAIuhYk9RHNIQSODTFUk5BZh
         DbqKrziQUYOxSUSKeLEJnNRM9++Wslyq8qDqblieVuBq/KeB3wxlbLflH8ye59EBKrGR
         Ut84PeljfwuRuG59oaFDWrpAjI2ofl+S+CFK3t4iC2yofYagQ+sMoDeIDeDESw9TWzSi
         7mmIJY1LNnVcqqbiENFd2N0Mavg2RlqMYO4Ec6nmKEiZvGbDYwWDXo53a9/cZeXnL1EB
         dqcc2Q9SIj4RIWqmHAQbRCbwLMA5cWoW/wJ7WTb4xoci/pyjiWMsLv71Si4eJxqrdJkv
         hFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jVRWDs7ZOsfWC76HqXJ0EedYmB9d7RsLi9QWsIvwJg=;
        fh=PxNtPwbDcoRZ5Oix4GdWqcrwCrYd4A6dAkHVklhQwWE=;
        b=Uugcj+Q5D3R/1R4zQRI8cgO6FVNBOvmeSQJWfwuiK30y84aJGJ9GObRhFmiLUgxvlR
         pMssoMnK89AeK4PkZHwg+sMmWeh/BIpfYRKZM4UGQCLB8UojU3YChbyV3jVasdRNIRDl
         k9mLI5OOyV7o8Roa+yyhSYQ/WdIwWN3HJOURGjfDrQoDunkq72zjNMNC082kOZyS66qG
         SIvQwtMtZ21QgLwpH4lOPuEHY7eb8UEbHxos4bKfiUM6q2mBMcM8a1CQWbL11X5oxtbY
         swiOZHdbGvJSF5ys7oLMMrAaL1tQDlhv4XU+AVOGnjerdRMNgDfMcPDc5ZK0+BCK3P/a
         ilhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778151149; x=1778755949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jVRWDs7ZOsfWC76HqXJ0EedYmB9d7RsLi9QWsIvwJg=;
        b=jO+zmxmoiRgTtDQVTe7WteXX3r83T9o6Wl/HxQtbHTSM/nE7yXP57AE2X6qg0NLaUu
         b+Y4pcUbAZwljKOhmoDMLFrVsfLJ/x1V44+ABojtWlQTvI7ywdvK91BTsDvW28I8TVy+
         ejdtg67V2pOqU7y/JquIbEQuQAfWZsAXDGJJziPTFHgARn7o9wBhyP1yGn5SkWI60DMK
         cCYVsAkP/9Ot689JrmWyuUk+8k1HEF1g0YaKqPb3gObtxVPD6aY9MYkyAu1luXvFEYRE
         khIfR3ZeMAYRhb3sClchfkWWntIYQKM0+xcKZPQBFYaMMBxGyjGKcUcGfZpcYe81vFK1
         aQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151149; x=1778755949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jVRWDs7ZOsfWC76HqXJ0EedYmB9d7RsLi9QWsIvwJg=;
        b=VMV4QZlgqUD+Y6kJbAtb+Ghr6CVJVo2ISTsjq1NQlLtO/3nUKH6fppduzCltLTCs4i
         QZMZtajFNv3sPHHmIpoYD86haVFMEBNtsL+SKBC4858UqoUsvOu30wT2pnmLDk2fWw1k
         SM5tpBnSVLWJhNmSwUw2qB7hsmr0Hb0zvijw2Xgkph5w1JVsM2MUITJr3p4Hmeytgb7P
         QnX3hLlHSYgyyJtdEMCJZLy/b/09u2Mx5xTaeuTjhJdBqPinnosaK4CcA2xIKND9nVH/
         WyhDaKBCo+p50yJvQNnTOYENO9itOfYRf/cPHldVPP+IvYmYTJnAEKRH1IoXao0fs5n0
         AOwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CicBM6L9nxEpge4Ew4t2RaB0A+GMFYTnCmyotBKcYZex2HGbvabEMiz54c7AyfKPoASHRkU3nVQ3k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+Llit+4x6uA4iHJ0sZ+EMA2jBS0soXwwPr8wPgrztOmAJPMX
	ci4CCE1tYqt/LUCN/3alGLiNqxs0sLvLHA/sH+St7q0zkQRrzdDae69CP+dj1W05O64ld0d6AQU
	yCofINDpuv1hD9AW4eKWT04i7wuGWDjN9DQ==
X-Gm-Gg: AeBDievkkXW3DSD3dwCB9vN4Z1l5q/m9RmHuw+zWd/aM/6Fz10V+D04A8pgvwUCoJjV
	JzQYEekabhS+fVxwAawRq4nylDukFAbnbf/wZ0ZcbU7yN+FrR7RCnN8/SBgnbJsQU0Og6dMWs3a
	vUKkq3lTrDgPu5wgLZsFQo8il7OO9cqU2QUC65bxOzeZ2oo/wlDtg968ZHIU2kltjAzmgTWcV/W
	ZshYMP60hgpyq9KSsepw7uQv6hf7YUWyyr9t31uleEMDW73DfvrpKp2dwqLQiAp2S7n46aGYnrJ
	jq8mCb652Phri9ZQWNsrJOQW0w==
X-Received: by 2002:a05:7022:43a6:b0:12b:f881:d8f6 with SMTP id
 a92af1059eb24-1319d05636cmr3552491c88.29.1778151148977; Thu, 07 May 2026
 03:52:28 -0700 (PDT)
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
 <CAMhs-H9+BfWWpaEP6UCpQvcSSzphGPre2GB0CeLfoPn9ePVwuA@mail.gmail.com> <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com>
In-Reply-To: <CAD++jL=UZ1_eSf5rpef4vaAdSHGjwsctPsa+UCLH6U3YPL+XJA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 7 May 2026 12:52:16 +0200
X-Gm-Features: AVHnY4KvzIG1e-SuyLoob72Oizk68aFHCsqWKNJb_WzZ8MWZlpseqczvaw8Eal8
Message-ID: <CAMhs-H-bU45vhV4XhBEmxV+6Yo2AmcMo55P=mRJ9ikKB5CRVhg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Linus Walleij <linusw@kernel.org>
Cc: Vicente Bergas <vicencb@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 36C9B4E718B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36364-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,secretlab.ca,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 10:54=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, May 7, 2026 at 6:06=E2=80=AFAM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > Linus, Bartosz, any advice regarding this?
>
> I sent the advice to try to use an external irqdomain already?

True. Sorry, I missed that somehow.

Best regards,
   Sergio Paracuellos

