Return-Path: <linux-gpio+bounces-32700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEu1FmtNq2lZcAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 22:55:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F154E2281DE
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 22:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5162301E3DD
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 21:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA20B349AEA;
	Fri,  6 Mar 2026 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xf+ZQVrV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21310349AF8
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834148; cv=pass; b=pEDrtXtDufNJc25mJUP6Ra45tzSfTAeWfN5Ok8omqRDmJdphX28z90u3M3yO8iFw26LtikQM0Udj+2Z7CPhYDDKSLZfeync72Bw3mk59KMUxeiNhtUF2Wx8SCfYSynEu+tgG9CkD5mn+etXgK862SigWGPT5d2HVBerrnPQKg9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834148; c=relaxed/simple;
	bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpjF6T5aIIZRP8VppG2tpI3RwlEsYjyMyId6n25EkBEVw0o7aMtRV7lW0282QDTUL86nG/tyRMXpjm6Kam56WRL8pUZ9TYQEiPfhi5dzlmE78UYgGGoQxZHgE8or6t+lZsukIIjWH/ziSCrDkKJzN9GFdlJmjodx/LZJHpUC+qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xf+ZQVrV; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso974432a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 13:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772834144; cv=none;
        d=google.com; s=arc-20240605;
        b=dv+vZIFLkf1bgmnqADEPyQnqMiKOz33Ikr0YDU/4f3rUpGIaovoAkGexa641wG4VC3
         oaxhGWjyizHahpE7l2qSUgy3C4eK2ZJtjHVkSwGcHRmAZwl0U3GgRaip/AVyQ9LqAUuC
         rMmGF1UsJ0ffmyZxxTTlF+HwupuVihRlG76TutHLYiw7R508SX7TnZiZ4wT1Zum445A6
         xs6B2eMsRQsdeW/eyNWrkWnNOCMpQo37iWWgIkzTig5el7+8uSIOjprdZLn9E0uzCh3v
         3oPayfunBr8RICI2Pwn+cVsOGA+0w3UDawnQOVTPlrnHgOHxXlYyW2bZJB/6G4i05vEV
         W7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        fh=Ru/w+LU8LEOU4WBc31XcEI5oVrBHDayKGAew132pggs=;
        b=EbVBDFW1uQcHjjRt6G8UTb3HKZB2vsFU0WzemHvQIYdLtX5y0+XpL9YOnypS1HmD6d
         aQQ2nSzeLeyhYbo4skxiRC/UO7PtfBRGyEXrBFcQuZ+/W1iqvc+JUHakGHA8KFZqzV72
         Ak0H2IUjm6NLd9ucn9HqakIslnNLXiYNzRq+NZfVZfWQRI8xHBdG25+V2jRFeiyGjG3z
         XpIfira8W5RcYaepV2Ju8B9LE8fv5IOUMn4SBx/JhBJShRztLYntbtd6FfV+t6LzjBWy
         kyGNV0y9fywCokD7MS2AX7MPWwe2R2/3AIleFeTB3/osgpuUGmogkGUoR0ITnpRD7E1/
         gQkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772834144; x=1773438944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=xf+ZQVrVylrn1ciQwh6ZrN28d8zJVHiVFFokjYypCrYbinN8+60kbj5bxds4+lQht6
         1WkHD/d+8qCA2kQaM6pPDQ2Pwb11vbP0zzeA6TPnlQQkMQo9gjhemEoedcNa+h7c46YD
         OO4CvuzZtg9si8Vf+WBK5vjVVBHydzLdc7AKzQtsTi8bKTPm5nvpcsbEJggF0gP2YG9K
         52RXxnBjyouOSXbHIz35mIt4ZkOPupqR+NxUst483RU3rC3tEaKwPPFuK574kmr6HT6S
         p40rosK31JLxOX8dN+KTVCbAcYPvGD9LM6STj47SyuUNQVEFtdJdO0yP27GQNeZuGuK4
         STWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834144; x=1773438944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=A00enl2Xt9TJK0jAQomERv9Jr3r/9CAwlfREYLUXfucjx4uysnNbk7syoeAT9rU3TL
         cJIOVJwZed0COUTZQO0qXHvnQUO8mvPojJUJlNYhFn+9DqE6PKVNhuXGdqBQP2Wit9Hi
         rdODP+kzWBIsPH/a8BnFgAn9JnIL/p8jhFALDHurNy0voIEec0GTsavh1BfQDw2BZZKn
         HcagjaypuKRbMFsKCv4WW9ygp7aqrjTr7ooSWYai3XOAzzh341WcY4rgB3L1OMM+nQFl
         Jm7VNszKTXnCsUnX+lsg2rudAyX93bv5yF7W6TCJaRl/SFJZT47VnozU6kHgD3VG5ARj
         YQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHuQZq6bg+cQ76ksZICGi7jlqIEZgMrz5TNjawnHbPAa8XBg14TBZz9XfQc/9VEtOh5zu9DmM+QuBM@vger.kernel.org
X-Gm-Message-State: AOJu0YzDl1coVrwzYJEpGnJWuMESylVVSk9dCerAr6fR0i8hIYXkrZBR
	SBz+3dSPYuvvGwS053fvN/hsUZZXBNMbFl9btfYySylgjZf9XFHPmZrFi1+CJ/SyPrO+ckT/Tux
	IH4pYZxssnVdOlbvR+GCF3yEKj0/Lwav4kuOqSdKWBw==
X-Gm-Gg: ATEYQzxIVFlEXOYq9ntz8hHrKYzBLLuNo9fmQ3zKK+gTSYijByp7ZqlpJx9S3+cYzT5
	/Xj1G4eiUtA702yxFbDjfybSRHQJhvwtUtz/3aDOd7dtHnK0edpG40xvgJhRBjHKXAslLTf0sDV
	0NNDQwual+Nc/QGQ7n74bEzoupsirJJVUz3c4dqMIouSdEHL58z36H4ilSInyxebkIvL+0O9fqn
	DwJashZAsF2rGPuY2ByPQzc0DPMFkGzsh76NCAxJl4+BIsvoOaD640nLxFYvtFrY38U9mZypmS7
	0fg3ctJZI/2IxZzsKbKjmqZXgl84iNvSidPotbh5uA==
X-Received: by 2002:a05:6402:270a:b0:658:b837:7953 with SMTP id
 4fb4d7f45d1cf-6619d4d3cccmr1959565a12.12.1772834144140; Fri, 06 Mar 2026
 13:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
 <CGME20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf@epcas2p4.samsung.com>
 <20251202093613.852109-4-youngmin.nam@samsung.com> <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
In-Reply-To: <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:55:33 +0000
X-Gm-Features: AaiRm50JsSJm1gZbJFNlFIJjOXEWjxFKWFy2GaNbHIFXw94f1BU7JG5q4xDsnDI
Message-ID: <CADrjBPrLYx=Se8bLrmm+3UEhvsr9Wm0tUi7SLyQnUYa5yPV_YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, s.nawrocki@samsung.com, 
	alim.akhtar@samsung.com, linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F154E2281DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32700-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[samsung.com,linaro.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Youngmin & Krzysztof,

On Sun, 28 Dec 2025 at 11:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 02/12/2025 10:36, Youngmin Nam wrote:
> > Several Exynos9-era pin-bank tables were implicitly assuming that the
> > filter control (FLTCON) registers are laid out contiguously from the
> > EINT base offset. Per the TRMs this is not always true. FLTCON can live
> > at a separate per-bank offset, and the current tables cause the driver
> > to program the wrong FLTCON addresses for some banks.
>
> "Can live" or "Does live"? Adding unused offset is not improving the
> code. The implicit offset is fine, if it is correct.

I saw the same issue Youngmin outlines here on gs101 SoC. The current
implicit offset calculation sometimes results in programming an
incorrect register (if you're lucky). I also saw Serror if it turns
out to be a nonexistent register (which kills the system).

As Youngmin mentioned "Exynos9-era" in the commit description, I
suspect (but can't say for sure) that all the SoCs mentioned in this
patch are the same as gs101, and the implicit offset calculation is
incorrect. IIRC this code path is only triggered on suspend/resume
paths which likely explains why nobody noticed the bug previously.

IMO, resending this patch would be good, as it should bring these SoCs
one small step closer to functional suspend/resume. It's probably also
worthwhile splitting this into separate commits, and adding Fixes
tags.

Thanks,

Peter.

