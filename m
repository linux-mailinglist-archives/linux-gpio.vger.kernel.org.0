Return-Path: <linux-gpio+bounces-38906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMKHFCxbPWr51ggAu9opvQ
	(envelope-from <linux-gpio+bounces-38906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:45:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF706C7879
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:45:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=google header.b=aBWAg1DA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38906-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38906-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1D6A302F59C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D107B234973;
	Thu, 25 Jun 2026 16:41:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80C25B09A
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 16:41:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405711; cv=none; b=GRP9TwLtkNbMBRquszNQVMQQWh9ZGvoJX+r8zMlTxTRK7fgFos7w+2usl0x7N8Z79wF2bOuA0wHBpbHWsQCmPPLS9z5YfAPf4/0W9c1dZ8BSpo86I4jlmVRaoWEHi5ZiobkPiL2xT43Ip+4byc3Hc8iIR2E+wDI1BXmTTj7F1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405711; c=relaxed/simple;
	bh=+v46uXgpyrK2X1lc9N056uCRUeluFWiKy+SGxvTaBvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbE3KkrJGwRvLM35kTOK1uoPm2QNeKmdKIUWHaRhB1aKh8lPX6u/kQUupk1jXI73KjinD+jkAdolRt2acg1n12lj/58kc8D6UOuocQGp5Ts7zxew005k9NKlu5NVWBggEBxRwHhwFc0AytGtdCa1oVTNRqRv9EURkRWZv7A0lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aBWAg1DA; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c07fcdd75d3so1194066b.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1782405708; x=1783010508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KUux407uf7IVJbeqmJAl91AE0wNU3JTBlBhaSFmrKuM=;
        b=aBWAg1DATLMBG4PHfug3bPkHfoGYIlKMUuBUwTn1vmkKR+TJhg6i3rb43IpV1jkAMH
         xqo7NBvH8cgQSktmuwBCH/iRMWOlAAUVbVXrDmZ+pGoGHW2hvggIRA04IThMaW0Zq2VK
         ik72MwPK8Z7B+3MdaGp6gzXdokOYIaWgudqcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782405708; x=1783010508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUux407uf7IVJbeqmJAl91AE0wNU3JTBlBhaSFmrKuM=;
        b=fLNT/+RJbMnGr30LROR1WRl7xMkR2rAB0JJPxKewGhbA07byOny0Th3iYPuLgg8pP/
         H8gMIWrnGHEkVI4P4C1T/VeNXgOrxm12EZlW18VEnQoiBBFRimt0h2NgV1rpik1mKYBd
         pR9QSOU2dyfw6PVjZ6UyO//jcsauDzNCP7QUUuSmsS+VWoAJ5Btbg5RvdhfHcF3ZARtK
         ymkv9tL2dBchXwnD8urgBgk2+W+ZAYv2T8M6UMVxnld2Ws9JgrMW2KEoNi42rxP06fjH
         gr1wxI8HTnA6+Oh167SSG+YFsI/S/Dwh60ywvGKlnqAd9gzAfwTQEjwoRNtfK8hYt/4r
         m6kg==
X-Forwarded-Encrypted: i=1; AHgh+RrEWLMFoRYdDV5w8jszS3CI0H9KkEGjPt0AQUtp6ba66f0B6u/uH81mbL5L+RywiQhZvYvU85R4+VO3@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcQWE4hN6XGO76Ozm1zupij7d7BXoH+ST6w4jbmEhZzfaTFsp
	T9o4LmwMDrmkt0+XzRod8Aei2yGxV6TGn8U56AvMhPmUb6lKuUHdzX4fKSVL0U6gWLE2fL+hk4f
	0/8+YkeY=
X-Gm-Gg: AfdE7cmk9Nt2jiyo3bpfFFY9WTbM9XKfMp1Sp0z9MmPxZQ4zaQA8Hdb5o524nWFXe6W
	6LVWUvBvGF84rAG/mQLdXnxhmM6mHmBIZ/eXKRBBAbADqzS7JpWjxwkKewgo327bUK+gM37afoG
	HohDGnJ2AD4AOBeXlrY0FlF86edEoAMi1p+KQIy07KLyXT/LvdCTBEXqwd2cnxf+boXzg+QEfNo
	G+5MnMnP2NMGQvoJi7vEEz9Kjh7OQ60GbWJ9ZINh8qBxiadxJxG5K3xDJu1n7f3nXs6d9rF6UF/
	hLmwIz5HE0jNNLYZEHuXt8CdBiASfzcMlgq8MN+flm5/nmAhbrQfV1VrZysMtkUHImEeljilDbw
	SngXukoIxo29lIKWa6w0CzBGvgA+qqLEZ/v5AKXyHJfBbbMxp5yGJxv25ALGfLb+R9AYHVBx6N6
	HUyrrFUg8LLUd424+k/fcE6KgRywfaoBoD2Jn4B49HSalFtroGCwYrULCVoU9LIw==
X-Received: by 2002:a17:906:9fc6:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c1205eeeffemr261715066b.24.1782405707960;
        Thu, 25 Jun 2026 09:41:47 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe5f73sm225384466b.17.2026.06.25.09.41.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 09:41:47 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07a6527453so3257566b.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpK0VqLorTbxENo6kqvddCfkk4FqejEbzTpGyugucSRalu6Vx2ou114oaG/wTYoSH5uXvzJUz9UmIZS@vger.kernel.org
X-Received: by 2002:a17:906:f5a2:b0:bfe:ed06:5a20 with SMTP id
 a640c23a62f3a-c12061a4554mr253123866b.53.1782405707045; Thu, 25 Jun 2026
 09:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Jun 2026 09:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjiEQjyk3Ez+x9dec38vK_rHzUYQ4kjF=jtQkTJ2Gadfg@mail.gmail.com>
X-Gm-Features: AVVi8CfEm9C-Ohq-hh4e_hvSzn-5wrDs4Fm4vDages3L7XnEo-renVj7oCPMCp8
Message-ID: <CAHk-=wjiEQjyk3Ez+x9dec38vK_rHzUYQ4kjF=jtQkTJ2Gadfg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc1
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38906-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-foundation.org:dkim,linux-foundation.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DF706C7879

On Thu, 25 Jun 2026 at 02:07, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>   a) Pull Lee's tag directly into my tree
>   b) Pull your merge commit
>   c) Rebase my branch and force-push
>
> I decided to go with b) as it doesn't result in two merges of the same tag in
> git history.

I think your tree looks ok, but I do suspect (a) would have been the
slightly cleaner option.

It's not a problem to pull a tag twice, and you would have avoided
getting all the _other_ random merge-window updates from my tree that
could cause entirely unrelated issues.

So (a) would have been a more surgical "minimal merge" than pulling
from upstream.

It would also have resulted in a cleaner commit message rather than a
"Merge commit '<random SHA>'.

But hey, it's ok as it is, and I appreciate the explanation.

Odd git histories that I notice after-the-fact make me go "Why?".

While odd git histories with an explanation for them typically make me
go "Oh, ok", makes sense.

Thanks,
              Linus

