Return-Path: <linux-gpio+bounces-35647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENOOKcxk8GkRSwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:42:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D424847F13C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F0F30F5E7A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 07:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D283D34A4;
	Tue, 28 Apr 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20251104.gappssmtp.com header.i=@bgdev-pl.20251104.gappssmtp.com header.b="gKFA40bc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554B3D1715
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361584; cv=pass; b=BDOFFg0ZaXClBou285aOkiXvN6curdVJQI0GTletb4CXFvzrk3cBCqPhJcvulJTG0O346bIpHKMdt0rc9DxNOURvaJu/UczwT4KJXbI7y1wD3USXtHhFk+DHnR5Z+U6rH6cQ1vQNQzNrJ2JqDjIknCDYORBhONnOichsX+N8zeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361584; c=relaxed/simple;
	bh=mQ7mUxTvH6aP1nchpyZpRRUgmaTTzrXM9GlJuuLU/M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWL/Z9rw0IdvRUn6Kt5t8RumeXn9mbFYnFzNyyZ0g+UvnLWZjKfIZUFx0dUT/w8nIe+BD7AQBpxWdBdmPAIAZhwp9CdlzrPBPulkU3VVo4QFRrRZzobWJrr8Z1FclfGq8ML7FfgKXjHwsS/JoQR0DXSdndbIDq1E5Q9KNyMpymE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20251104.gappssmtp.com header.i=@bgdev-pl.20251104.gappssmtp.com header.b=gKFA40bc; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dcdf60427so10032061e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 00:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777361580; cv=none;
        d=google.com; s=arc-20240605;
        b=WHQt7MjZkyFEAT2ylyL9C1l+Dwx9D+62l4jgJoAd3BKwzqTyfuq/uwrP6EndMHbg06
         PFYg2tAF9PK08GWLfjtNhdeC2GTVooVU+Gp7AAQjtxAfAAU8U8Us8SLHR1Nhb/ewc5/M
         S1pU79WDDVY1XgJ7IL99gRzRA7hx2AyTlCYEXzTH1PvRIW9aLYJA0IjKtmyPZnFYHJNZ
         1Fwe2xcm0xKqZycmq3OC8CZHThqwD1fNLMHFMloERsDtCrL9FXzdYiGc6hFwIYxbQOEB
         L9lyx6nQulzAqnj9sf65qbG3xAyLTSisQWkoAcKVJfyx/UbzjTbXpCc5z4N8YOrhw6p8
         nZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o1Mjui8+dPPNhIzJz+UiQVVxTGiiMA7sMCN+VNc8q1g=;
        fh=loZkwI9TGpMK3IlZZsRPEyBHWurdghocBxL/KkF+DXo=;
        b=cm7+MAbYtiPM0ZYeoWGT0dvSpJ/0pdk1QgC2oVpURxGdXYZi6O0HWAfRRCxDICFs1X
         Z0/mNiPBcR+FyhUTCiA6tdAsYIyJwS3raTN8fDR+iQtNHANZlw7iNBu1R5ghCUHNDyAC
         GV6l1l22xKwYB0irFaCnYosHl1nWFQnJzPXSUZqX69vWKOnw7zFRjIBziCC7TnL7vx38
         WtWcuxJs0Ljd7osFd6VNv+1yJH5XH/8LBMmkt2jrcyjUJhvAj+H3CZ7xxS9fXCnqvHwE
         ALlv+Vko51RKfKHuo9xRvxxF6jQBRSV2hMQ2uwlFhZPWJnWqXSANV5/Q1Uu64cNzGHsl
         HQuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20251104.gappssmtp.com; s=20251104; t=1777361580; x=1777966380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1Mjui8+dPPNhIzJz+UiQVVxTGiiMA7sMCN+VNc8q1g=;
        b=gKFA40bcTYqINJkW5MOeRUAonLayMxOP+rRvbrU7xurLomvT5neZ7QCxz6i0KBhJ6a
         tF/ZE+aBCIuFhLMydYptry7/pA5ohkKpOiR2YZBxnwTMFzcfsugQxB0sQOOTvexaTBKB
         bSnjNnwmhaN6kaQLAn8pemTXGa9XRreBW46NZAxcloQqQjUI2E4Bo+7L1LyRsOCF62bk
         hcczCkN5l5oEJMNGv0SL2kai3H4IIvst+frb1/w3JMNyNnMK8pkYjU0eqt11IANrlxBm
         6Y0R5LcrmF1d7Ka7MdQyOJPlnArOP6+Y1g1Jl7ZSoEa7SH0ULSn6Vg/gMfzKif2c6Y4V
         D3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361580; x=1777966380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1Mjui8+dPPNhIzJz+UiQVVxTGiiMA7sMCN+VNc8q1g=;
        b=M05mN35DRy7pPOOeASLrXUZY2Z85eheORqPnz7LgyC/0cz45Av4c139JlUTbx+CSSv
         g2LrBFBDmk8mtYxXpHK3mChRs3ISHc7peXcFKx0NmTmwdmQwMac3YrlDdq3PGpPLId/F
         71AeO11zD57jDjYh6U3EpddgTL/10QrnSZ4j5OcaK9qKSB1oOfF8Bg1UMR5dRlks4ifN
         m0k+6ZtRZGzyopLAq8zncF/hr5maYThY6Lsqb4JmMqNPaP5FeeJYqxho+z6LBNLd+vf8
         cgc3sn5YPHT7Ewf0TCPSjw9i6mrD+ShMS89YF0Nb1hdB+Yj3dDyI5OyiLRVH/qeS4p7u
         CxGg==
X-Forwarded-Encrypted: i=1; AFNElJ8ftvPLLsIsbmE69lT/CN0qR501NSXKRJPBDBM7eD92mWpjTJFWpvoiLqblKUVZFY8fYSZslGPOMSBD@vger.kernel.org
X-Gm-Message-State: AOJu0YwYToPTGfeydu3rRbqEcKAExbqM3Y8h+7o90gNKOwbOXOlnbwFU
	ajnGOQAmlitMNoxrOEJEPqIH9D0BUCVPGn3pIsB89LoFXOdbamOoIJxzXolTedq06fi1PYl2mqE
	55lUw0naz+PDTCcJ1aK5W7E/7/4RV6sFcnB0hpOOekbWnXLCx/nkB
X-Gm-Gg: AeBDieso9v7mLGLr6KZ/Hdl3cjb8vcTWijCgeYRhb1+vBYR4LnaN3KvfLDuOQ10zgyw
	OXYPcGSeHl+rN2JVC3nJeNKZPVCHWcznHu3LjNVMHFPUYRlVrl5w/ty8GSGplRQ47y1hTXLF9ZI
	XSdh61onU0yG6rxrlnJe79Q3MZBSiKRRCNg8aQkLA0iAw0Ps+We9C2ADL/9slD8a8hah1g0YkjM
	dnFAoTxYU27VO+EsTUrtOIcu2AynjF2OiQOgqIEjrRSlHTsdzFgchQBxAJVkUdfJ3ASd8lNpUjP
	3s29CjHDFFbs0lJGBlgelatuBLrLrxOOFqiYQosNXohuTdUAnKXlDG9mnaGjk95br/wiry/uwS1
	SRxEZ
X-Received: by 2002:a05:6512:31cb:b0:5a4:d9:88a5 with SMTP id
 2adb3069b0e04-5a74661d944mr674614e87.24.1777361580044; Tue, 28 Apr 2026
 00:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
In-Reply-To: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Apr 2026 09:32:47 +0200
X-Gm-Features: AVHnY4KPiQegIlJfPXwzLkXfc-KPxkjjp0C9FHSKowJvXwAbWmUqejDdsx-qHVk
Message-ID: <CAMRc=MfrJ7YVyvx8X-5L02nvfxRY33PHkek+HYmik07PNVO7vw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: Use generic MMIO GPIO some more
To: Linus Walleij <linusw@kernel.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D424847F13C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	TAGGED_FROM(0.00)[bounces-35647-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bgdev-pl.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@bgdev.pl,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 10:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> I found that the Altera driver is easy to convert to
> use GPIO MMIO.
>
> Only compile tested, I do not have this device.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Rebased on v7.1-rc1
> - No reaction from maintainer, just apply this please.
> - Link to v2: https://lore.kernel.org/r/20260313-gpio-mmio-more-v2-0-0f77=
7b63105a@kernel.org
>
> Changes in v2:
> - Rebased on v7.0-rc1
> - Rewrote to use the new generic GPIO config struct.
> - No reaction from maintainer for 13 months... Maybe we should
>   just apply it?
> - Link to v1: https://lore.kernel.org/r/20250227-gpio-mmio-more-v1-0-0ea4=
ad43d304@linaro.org
>
> ---

Looks good to me. If we don't get a Tested-by from altera by the end
of next week, I'll just queue it and hope for the best. :)

Thanks,
Bartosz

