Return-Path: <linux-gpio+bounces-36095-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGcDLjMM+Wks4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36095-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:14:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03F4C3EBA
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C175C3005AA9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 21:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C79C33F586;
	Mon,  4 May 2026 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMQIB1ne"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF633E37A
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929263; cv=pass; b=AuyrMVmSUq5wFwbFIvVkv3Fwei4C2Cv/MpnLr8bn3YtoBkasZwoQy+vv5FYk7MgygUOgzkDYiq8vTTzEs0cOG4/1bcSUt8KhxI05Z0TgOxre9LqueSTWSF4gRWumKRyxD4ZKIPzVMvdMEs05ZbOxTb4ilxIyJzV/cK6RG9TFMqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929263; c=relaxed/simple;
	bh=ZiidLCQ3JFr9SKmr2AwxUcfbkN77nExVmY6pClRjI8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbZMrB/eYypE31l+8IXjAm0NASaSqZBKlPQKSz3RiT40xbCB8+aLB7VKskyKeq73QjFWVJa1ll4PozdnyNmNbdXzTClJk/OqG4nEpmmReAfOQpjn0fbMyqYBMUz0aIMZ7Z5nwXxeqQWKhXIee4pkYItgnzuudZGi4CID6CNBrPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMQIB1ne; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c305f381eso3413583d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 14:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777929261; cv=none;
        d=google.com; s=arc-20240605;
        b=DKT+BTqeBVUi4+66mJPAowyTmfV70wSvepJa5to/kFQsdmaRc2RQDs2h2l9QMwccJR
         YpD4doICdZO9XhWDWp46rLCK7lOn6AQ434MViNUpCXfQcrBdBWQqR5IvdqcO8HLVRyoz
         TYbT9xlJZXfgvO1kGYa3L65juImuQimHtV4r567jeWSxa757KEdDXQ7anjoephzScKSU
         JNOko1J9/tXW7Q4PG5znG/yNerg3PHmR7OjwJ83DwpFt47FE1T8r/oOkEIcp3suSwTDp
         bqFNH529UfXNrf8fpWr/Eq7aCVChqzQsaKskvE2cmJeJJL/ibHzgJzCxjQkyvR8B+yAD
         UGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZiidLCQ3JFr9SKmr2AwxUcfbkN77nExVmY6pClRjI8U=;
        fh=mQapiiD/r3JNVY+KUJbegMmhVKX/TYc6EgQZuz5IEyA=;
        b=YVBFVVDO4j2rFGuIWHgcs8bp24uOmbZjxOsSY6lNmFW1ysgpwGn1fl86IaOe6cCVUS
         BBAv4iLLMXQ2U0Ysbvr3T+hqbbRIhh+zXUudRz78dztHf6S+I3d/1rYmata+eFQBYvdI
         OH/JzIa3gQ7i1A+IE7S0pui+WjjMliD0jYc8BY7iXKNt5W5Q4tJpp1P/w/ZscvmHW442
         eKBfjg7VZ2hkoEdtQQe4d2/HR54+tB3RH8Mz/hJ87MXcwrqV608iYAjyAZFebINp6w4C
         MyuBTO4ZVDa4Rc8NbyJBlze/tPH27Sugd4LyBTB9w4UOodJiyK8O+1oHKl9HLUzyJRI3
         bPVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777929261; x=1778534061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiidLCQ3JFr9SKmr2AwxUcfbkN77nExVmY6pClRjI8U=;
        b=sMQIB1neUU9XlrptR8sGWqjkN0V7EUNRb790/wZnysW3ppmKrHpIwdgw6NZ7MRFIgJ
         PoIEDYhjynCCpARFZ8xPTunV3OxgnMWx6rD1RSmc0zdHXXejv01lU+9ObeExRbglN+AA
         bh8xJbnOVI8dI+i0hQlGIylNwlCVAfFb52PV9thqm7R9IKOEMCtP3yY6D8apa8q2+xfp
         ZcpWVGyhwtqYngYU5A6EFmKQ2+Ph+oKLkAiVS5IbiyWNFOJEWO8y9P4Bpfls/4/uo9zP
         TUFJLh4CSJIEUlfJxVF4Ng5yhkjYN1Qpldj9040mZh3vPDpqLxbyRR60RXV5R+p/12/o
         dmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929261; x=1778534061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZiidLCQ3JFr9SKmr2AwxUcfbkN77nExVmY6pClRjI8U=;
        b=coSuBpEKUoYUmvbCXDqCU+B4epMzg1M+xubJynLMFjzk4pESeiDMJa7BUyZ5P8H5Fa
         /EMnHAx5efKagDXmXbPXb54x3MNhiboRMDtUqlcV173M8xt21aICwcF99JvMSVLxzJMM
         Buc4E8xtB3d4IOIimpKzWOcDuKHs2Pfo4QU2EdkxJFFqvrG/UEBsJS1Tt/UQvsj99BiX
         HmpDAm43nk/z9Z/7lqN8Uh2LW6gwPaG/9gVGiz1YN8dTWXb7iNETu+F9xK5R0NLqPYaX
         nPWniz91o5dTsKYdpGDaB0XeISrtEEKaXcLBibjCopXoYwe/0cWUjxoFbNeAdhSeK3JH
         B3sA==
X-Forwarded-Encrypted: i=1; AFNElJ8a88bfqIcv55S1dM+AmCISCIw4yUWRYy7b24/9DZ2mj4XAtcRW9ilU4wsOobm6ryldboUwVW6+8GHb@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9KkarErsAFClb7FbNISwZvTvXjwzQM7tIiF1ae0n102VUk9l
	834uzyZcOQkVUYLJfO75empQ8OvsMULrpL/ST1s3eyyVxmvFqR8TUfUuLZQrcKL/eMKnG8r5V/0
	AVHuxclWbtR/x1BCOjTq6ubba1H3K+0d+OVYO0VI=
X-Gm-Gg: AeBDiesPtpyFULgUeTYBtdPF7Evsk7T26Eduu3xhrdY2vNh5dn3HIex40cVJOiN64bL
	P7Mz4lqq4FwRGmdY9D5WSmkBzreF8ysStvQlN0aIzyg4HbQ2GVJ8RREHV3MFU0FVQfAimvFMI/I
	DkDlVnO058kWcvEsdC3A/+yRJfq9wnD8eeQejXlwd17Ct25rRPYJzK7y+0l18vGI4/MRRJG1qAv
	85xOzkcJH3TKcZwSrHmGzP2AfASqerrFkvcjPZWVaJvOmau7DW599Y4/pLxFDah2k/SVhLf6PUg
	D3ucpxHrxCZ0Ots=
X-Received: by 2002:a05:690e:b8a:b0:65c:2738:c68a with SMTP id
 956f58d0204a3-65c69ca8ea0mr600203d50.15.1777929260654; Mon, 04 May 2026
 14:14:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504195251.53771-1-lucasp.linux@gmail.com>
 <DIA656PT46GW.2Q15WVT679RS6@gmail.com> <CAKYXYMRX-oV6iO+Kh+dV7_2BfsY9gjdXMw6cueOgYw2hjLWeaQ@mail.gmail.com>
 <CAKqfh0EPFPxFN8ime2EaO9gP8z2m8mshR9b1dEswgzQe-2Ge2Q@mail.gmail.com>
 <CAKqfh0HA7s=apD4u3DbauME-7NWK7CbUAAm5ArdkRjjHHF=hCA@mail.gmail.com> <CAKYXYMQQ2UxLJw=2O2y=fLL6Kpp3eUiaH7Rx4MF5H7wcoYzcLQ@mail.gmail.com>
In-Reply-To: <CAKYXYMQQ2UxLJw=2O2y=fLL6Kpp3eUiaH7Rx4MF5H7wcoYzcLQ@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 16:14:09 -0500
X-Gm-Features: AVHnY4JigjwtFbmS0-Q7ZEX5Eohklvx7xm2P3vsbyIWMpPLDzoVDp32-G3gbRYI
Message-ID: <CAKqfh0E5RnOpkXBgJ5gUzPgk0dYs_NRi3=9Df0DiSp9RebgmSA@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
To: Lucas <lucasp.linux@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5E03F4C3EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36095-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, May 4, 2026 at 4:05=E2=80=AFPM Lucas <lucasp.linux@gmail.com> wrote=
:
>
> That's a great suggestion! I would love to try adding strscpy to tools/in=
clude/linux/string.h.
>
> It might take me a little more time than a simple cleanup as I need to ma=
ke sure I don't break the tools build, but I'll work on it and send a patch=
 as soon as it's ready.
>
> Thanks for the guidance!
>
> Best regards, Lucas
>

Of course, but again, don't send html email or top-post, read the
mailing list etiquette at https://subspace.kernel.org/etiquette.html.

best regards,
max

