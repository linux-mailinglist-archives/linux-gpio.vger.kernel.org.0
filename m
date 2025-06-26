Return-Path: <linux-gpio+bounces-22258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C3AE9DF5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 14:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DBD85A5BBC
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 12:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16F2E425A;
	Thu, 26 Jun 2025 12:58:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1D2E1C51;
	Thu, 26 Jun 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942710; cv=none; b=VIU017bXVlrlQshgur5a1tR8MoeZeS9MIYj9ZMfmG3VFOiGhNCmc1cCBxRunbNQI/nHbYjjjBgbABouQqnwMMAfvCIyH8Gs0+Up8r1apUmZrrA5C7h6X5ihZsKnQV8G5XRm60tWM6J8R/jveWXG+w8YbTOvTrUZLSanvrtBMqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942710; c=relaxed/simple;
	bh=t4pxBLbqxxPIz9D2At4HMJPxGgXLJB+JnotsqRyP56Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJgZ47pCL8kcjMRXXua8LdIcX7AyXLhE2FArs25FFjXkWWRfoUK6JqfwNjCc2SyqEun7EGdUtMHG4epxm9JLyOGZSFqaJKj5TLsYZJztgfChKIUG9Bj853SNaZFIQhE1oE70bVexEuvmLvVSGbkyH5MqgXSBzLJznTyrgNsUYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53167fb5690so347419e0c.3;
        Thu, 26 Jun 2025 05:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942707; x=1751547507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qf/4wlX2i1QC3Ii3lUg37yjArJzQsO6siXDkyQcsJXg=;
        b=wkLbWG1otfRRBe3tjtrgeJS5Ox+HRf2bw2Du4crHjPNT9Nc/SQAt4xbP26+h7Rr3Ru
         bik4ZIAxstg4rpYz3yqvxSuAwJv4zRz6KpbK9d4Q2vIeHMAnR+6R+J1m9P41vQQesABH
         ahuNHImv6zA2YsMUuN1Le0S+juz+QxX1QRPgMN1PJTUAkLQ0ijLtkP3okSe+1Pq7A159
         /EkaLsrr5dhg98BbXtZnPgRIEopz+5TFR/nuN0DNcf+efx4kJl81X3XRgrBc4Rn/by+q
         tvzE59qzpiFEYmpsxJ8lOKJ4ZQ4Nf+H62nA8fDIqBkDNXbTrKsndyiUWiYndE4HFBdo3
         b5ug==
X-Forwarded-Encrypted: i=1; AJvYcCUY/yRbwcJr+X/D1zNI45OqVJziwFbbkH+xmWPj/NTWoBREF6MPZYhhLJ+JGNZhKybb8Yb2F2tgRosaVC1jWoXBSZI=@vger.kernel.org, AJvYcCV0XIdJ86RaqHTnGs5ppuvv7cDevnvyyAwv9pBiTVbUWS8FPWIZ0xmCTJBCTTeOkWXntgc8czCbklLa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUI8scM+ruZht3nSnDKvVAjN6JeiFU1fmSoTn2+Z4BBt/Efu9
	U+rM+yba61+0onUeIEIR0SxE3zxc0J/R42FkxUvLgV//37b5KtA9yo0V2D0X3t/2
X-Gm-Gg: ASbGncsVFEFGYjew7buTJayzYkNNM2888ksNupKtAoBiQohx97e0Av4G/TcAsP/P50q
	hLShUFQN2jFtDWH6uz6HLrKoZrJkg5eCv69VBLOCReLqmGhUjBGA8bjKxs2hkpF1304WGmSMwFD
	dwLpdVp3MbrP7xx+1uCm9AMewOvVF4ce7fExHE0fH9amKguT7q3UQ/gIZ/P/HplG9GsbPTa7mv1
	HoEjXWYsuWZ5lH4CFtSUdDNaaZz8RCOVWt26YpjsvFgHItyvFzJz+BcyyvPbTc6wI4tZxb0EzXV
	MQVPgF1vFfh4ch2yukd2TN/X5UAYjprx5NSU+ZLbtI7+nf5eH2Pq41fdALedzlY5PAKepQl8P7I
	2RCRq+yVqijHyZdJKngvqZ41Qlk7q
X-Google-Smtp-Source: AGHT+IEbIILD+HXby+FUlqlZKe8TD7fXTiOrWFr6BKZ+laZdXrAvOgUKeui4kOXGO7huSwN1GBCSkQ==
X-Received: by 2002:a05:6122:1ac2:b0:52a:9178:d281 with SMTP id 71dfb90a1353d-532ef53fa2emr5870824e0c.2.1750942707059;
        Thu, 26 Jun 2025 05:58:27 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab37e4a6sm2284438e0c.40.2025.06.26.05.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:58:26 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5313ea766d8so346036e0c.0;
        Thu, 26 Jun 2025 05:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXkeIj0dIuflJyPmuU2qqeK7gChxTU/Qa0ahZJg73kcqXa/jgkI4l5gGtsBoXJaWtgOCJ2UQvZPJP7x8WIUIPQUEE=@vger.kernel.org, AJvYcCUlePgkW6LtVbZvrmFAqP3HzlCbvKovCgnwQMjeqYr8He7luMZJ8w8mBixlw1yzxh01rC3w1PYW3RdC@vger.kernel.org
X-Received: by 2002:a05:6122:8299:b0:530:720b:abe9 with SMTP id
 71dfb90a1353d-532ef638acdmr5485618e0c.7.1750942706217; Thu, 26 Jun 2025
 05:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com> <87cyatrafh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyatrafh.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:58:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUb4DxraEEr6HB-seQpJ3nij7ydE+B_4AP=gMf1NLZWow@mail.gmail.com>
X-Gm-Features: Ac12FXytY2D8l01bk8a4r8WewuWWXJNIXUmrLX-3512PduRulCNJwQaQ8BLLprs
Message-ID: <CAMuHMdUb4DxraEEr6HB-seQpJ3nij7ydE+B_4AP=gMf1NLZWow@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: sort Renesas Kconfig configs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 07:11, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current Renesas Kconfig is randomly arranged. Let's sort it by
> alphabetical/number order, same as Makefile.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

