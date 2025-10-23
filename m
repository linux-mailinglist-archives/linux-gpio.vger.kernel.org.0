Return-Path: <linux-gpio+bounces-27502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217DBFFBF4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445FF1A04ED0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306F52E6CBF;
	Thu, 23 Oct 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVyFHnn+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F482DFA39
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206154; cv=none; b=oQAmfRfTYdN+H1p24FmrCDn0g9ow9tWeJLFDEGn6hYlqQGnVWdUXbkUf6NuU6gjfltHmEK7K3raOmKd56m9ailE95h27iZPzjEIRkVXjQhsw8L/XgYeiYHr+V1qhqUj3swyCC4yP4xJ+wJuCrEr4eaC1yUvf/1EQMRvmy43p7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206154; c=relaxed/simple;
	bh=8pCsgcD4bqNCWZyT+UngOBilZd2QN6TVO303H2MtuGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk7HK6KKuAmcwNvmQVrXQq3lRNRo3DIw2XMR4pAiSABrtWV13YpkGc6rOKC4qFPgZt7ZYpGqtB6pChRiLTMBTxBrcl92cIRrBeXgmfnHVq5mK6I8zrh9isRv4mXEsp/oInotN4NMZx1+egzXTaUMDw+gJKXlGrELVksaTZKUj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVyFHnn+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59052926cf9so583070e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761206151; x=1761810951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pCsgcD4bqNCWZyT+UngOBilZd2QN6TVO303H2MtuGc=;
        b=GVyFHnn+/KaNlw6mKGxHPONnQXjHs3ISqmXWPqYaTiWRJ92BYF3At4qaT/bPFB0nah
         CgQzPM5/NIHvAk4yKONpyDH99JQwqopxjWvRnjlMBSvSgC59Ylt+ZuORcFCCEnV9WM/P
         JNMCcg9vqSvDrjt0QGpoRrbbAbxnCSRXA40UAte1PwpY+66pgIWTXFQ3FSLf7J0YcpFZ
         HzhLNJmX39bDFxVPWi2dub3G92WeNuDHiLbJp4nh008M5a8GB3B8otdee1revD41MyXj
         xFYBL0k3tKu6zX28YIKNfIMmvbimtmeSM0b5JancWkIpI55W5QVeXEXO0JJYiMA0rWCC
         dwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206151; x=1761810951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pCsgcD4bqNCWZyT+UngOBilZd2QN6TVO303H2MtuGc=;
        b=wG/N8o43azREORQjMg9GmYgt1mYntuuJZkI28ynRvisStJ29uhi1mOhfyRRSp6ky76
         n9nCBy06jkEkJ7ddegaB20Z6OspwRjc6QZT2kNV4+3ElSPYWyN0hX0L9gXgzMTZeOJqI
         z/UL7AHn+0sLPdLMNSAkqBhbarJM6IPUYM48TqGQzNBRxXxvsKb4F90TwQTTKvTYe6HJ
         EtxHyseqY5NwWurgyQPdSn/W6CfrTpgZ4g61NzOrJ7eJ3pqvYVcUcFD6VEIrVKObYOcH
         L9HkYV/dI/9iY57x4ebsaZCs56Tu8p50WVXz6+acSjFvnM8cB5yrHlnZayMSXvK3IWyf
         /h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVswT19teSlAL8xKl9WANzxzuQnGOGuZphPI52izSfaWVnix5DhGqCthBaYfh5Vo+5WOwIs65SIaVAg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4mCU9IY3P6kBP1sfj2r7iUy+g8UWuuindfvazWRE8oof1GM0
	iiQx3X3EeLMjiXj4JVtn/DlhIN8lXJnq5/THR17Nq8MOHgVN7CWUkgrbMXc7FpS9Vnf6BF1tDwZ
	dVq9pDU7nzRV1FFHZy73Km8LcEtN5+nYIM/3JmzwLWg==
X-Gm-Gg: ASbGncshPDzkcVZoysXAHpkmgzFpVWbN/SaTcMRofsaMk8FMrxueMh1P4E2Q/LtsdIO
	zdE32WHlKcN4RkMGiM0ZAyhnYI4SRwdmOLWu2lYn0zFWoFoFA2XlEBOlh2rAt0zAxbZSGk8o2/j
	WJ3hroUVc7pSWJe+ePQ6byYuKej2ZtWwsa509PcCcwiBmlU9YbrntdH5D6aJPqqrnRI441p8GwT
	nrFkW1bzjCn1RrOItFXoHcvGkFBEtGqKTrR8/O6/GxLXEK3dBwrKo+3CVM12hFSY8E38VTEmaEz
	LtGRJQVHBEhkgAs=
X-Google-Smtp-Source: AGHT+IHOlmCV2+Vg93W0jlAG+gRj0Byqx/PjSQV0edhkqIJLQKKohxwodoQ8/ao7KpCEJ3ghbbA2pl6Ihv2wI5RBYiY=
X-Received: by 2002:a05:6512:33d3:b0:55b:9796:5d5a with SMTP id
 2adb3069b0e04-592f5a597c7mr562701e87.26.1761206151440; Thu, 23 Oct 2025
 00:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mf4FnBoZfdR3gG47te=X53jASzb6MVnUmNw2q1rtUwxzQ@mail.gmail.com>
 <20251022192901.GA1265216@bhelgaas> <aPneCYtkbxWp4Hox@gmail.com>
In-Reply-To: <aPneCYtkbxWp4Hox@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 09:55:39 +0200
X-Gm-Features: AS18NWCAB8MfhfubKKbjuEctu3E5mmyu9MaZ391LsVqFBFwyCaxgZ34D24NyEA0
Message-ID: <CAMRc=MdbHqMJv4otgG0Cwc1KcK2WbL4JL0Q75PRqv8582yexyg@mail.gmail.com>
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Michael Buesch <m@bues.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 9:49=E2=80=AFAM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> Hello Bjorn!
> Thanks for the review and mentioning the diff between v1 and v6.
>
> Hey Randy!
> Please let me know if the diff mentioned by Bjorn is enough or should I s=
end a
> new patch-mail describing the v1-v6 diff?
>

Yes, it's enough, I could have looked it up myself but I shouldn't
have to. Please, next time just list changes under each new iteration.
Preferably just use b4, it helps with version management.

Bart

