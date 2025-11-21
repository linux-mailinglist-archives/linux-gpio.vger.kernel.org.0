Return-Path: <linux-gpio+bounces-28971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD860C7B62F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 19:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 964553A15BB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 18:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98B822D793;
	Fri, 21 Nov 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YPzCCk4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E86824BD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763751184; cv=none; b=X5yqcYLylxzaAVILVw8yTKOf/lHPUk9Bj9K2B3QiAHsnvVjGyYNmS7edNyxewlmjxUEMICJb1BoIxdsY7rXpcw0hzf+cFUrX1YH2ztGBkfP2+sMqqaHE6FQ60DoKSM3rVfPniDjGwdQ42T1EMol8R3pzG5tl5DYXNYC7SiqEoGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763751184; c=relaxed/simple;
	bh=aNk26ZsyzggXOlrkRkv8z/AQV3GCyRrEQwRqp78vCnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5fL3Uvzo7HtTymNclv8PxzV5XRlWn6Thhs4vZeNOpcR6KEVDcuY1STtzcihZv/uXd2eduTihAqybvY/c/8j4aBzhemPW4aAMeEQxtT2r3Tw1iDTuTGWPFjBx/Vi0Ay6knQHwciT0u10YcknmDGFhjQaT1h2owtLQF5m7oIp5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YPzCCk4W; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b737c6c13e1so433411766b.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 10:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763751179; x=1764355979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dj2JreDzzIBzW9XQP1M5pFsgec74hU7D1bbxKqw8/NU=;
        b=YPzCCk4WJPlYKBpDunzNQ+srJodh/c3SJ+LTbQXgM1dvIR6aFczlHI7Umfun1yfPlS
         IDYt8c2k4YBoeFQlNqsMaZsvpzwY0ulYfzvGtYL4wN4fYI1HHD46IFS2fWltcRQh/4nx
         Crf6uYDd4VOoVHSKRp/PVibPaG3oQvJHiLwDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763751179; x=1764355979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dj2JreDzzIBzW9XQP1M5pFsgec74hU7D1bbxKqw8/NU=;
        b=v9kWkFFksEEtwUsBdUEV+yD2XLudO0t+/vaK8vW9GynF2z1MomaDXqC3qYbHa26955
         Kifzx9jUNnBW/ebbEeQ/DpBB5Y2CdYkAQ428YNneflTnSwWT1Vmkb3b6Uq44RTAlaTyR
         caQ5mZbDoLG75DNhJGl5yV3CNiOEKVoecHJYLeetI6DNs+9AZryG9/4XBWvOtvBBGrOK
         3b8BjFynlI8E9vXJd3L6AmAodjOb6g+DsZuBZu2Xhgsv9HSDwX1KWAnPYaRStzS/BZW4
         slKLyPRT8vOYLnBDexSkAv8FMntpeva2KSQoBqTO1pQDnNOYO/Ns6kcWujf0Ai+13VMH
         /fTA==
X-Gm-Message-State: AOJu0YxvzZTGJFH2ia3Ww/PoHMMC7k6tzaDzZEkPQiyu35/Dv6sxXPDX
	DzJgeHoCJ/keghoTP0lUQ4eGpVnYsZ4c4zVxSPo1QDofcuDnKX0nMTT0Yd+CfmVvIo6C7g6l0+z
	8XbVFYj0=
X-Gm-Gg: ASbGncsX+RPMbbU4FjZbwuiqbciiElxIy08cVv75I5K6GXJ0LIU6Q1sDp6GcyBeKYV0
	ioUNvxE7vvZz7viHQX0xqANJFGRjZ8dA9NCUMSayYGUULPaSbhxagmpAQegbIiKmTbECljQ0LSa
	pKjsutnoc4LTdC9jtYMVBqjB5NLCqw8QIQhHTl1xSNwFUo2AY4IbfE3spRpyHpHLM+g4booe5NF
	SVB0P1rXZNKq2kj25Dhok0jVMrKobH0zgsLCdRDhYQki9i/R+T76G6KAftGAw/fb/7NYJMrAo3G
	sHchZZ6bb05AUL+ZryBqjSLN9FT/RT8S06L/x0PwsD+nJsO1R1jc8ftwsEAyJNQn8lqGOeJqLlh
	AViqwF88X3sxR7XKBRaPE2wB7h+yyOqtLHW2MFq1D9qhwbabp2Q//96TSU+HgzT+YFhvtppzryK
	aRe7yeE1VJHQvRzcttt/+7gLZsEvh6c65e9biKWbormw8yBZL89o+xqVBrcf4S
X-Google-Smtp-Source: AGHT+IHpP8yajY4m0EtErcr6eAzsI8aZOWyh7eUAzTrC9NZ7hrMS6SQYlpgutaHa7vWr8yxVapJIJQ==
X-Received: by 2002:a17:906:fe46:b0:b72:a899:169f with SMTP id a640c23a62f3a-b7671520dd3mr386304866b.4.1763751179533;
        Fri, 21 Nov 2025 10:52:59 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff4096sm529216466b.49.2025.11.21.10.52.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 10:52:58 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735e278fa1so472720066b.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 10:52:57 -0800 (PST)
X-Received: by 2002:a17:907:7e89:b0:b73:5db4:4ffc with SMTP id
 a640c23a62f3a-b767189c970mr377769566b.54.1763751177297; Fri, 21 Nov 2025
 10:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
In-Reply-To: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Nov 2025 10:52:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=whp53JSL2koBkHanTr=6cB91PjodthW-0krexvwe2fHTw@mail.gmail.com>
X-Gm-Features: AWmQ_bnDox4L0nKeeK_m4rj52KwN89ULJFseaoDbWKuSrAXLlagb1kkVx8HkSyU
Message-ID: <CAHk-=whp53JSL2koBkHanTr=6cB91PjodthW-0krexvwe2fHTw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v6.18
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 08:29, Linus Walleij <linusw@kernel.org> wrote:
>
> I'm starting to use this kernel.org mail adress because reasons.
> I think I managed to add it to my PGP/GPG key. The signature
> on the tags should be the same.

Side note: I don't really care what email address things come from,
the same way I don't care what company you work from. I trust *you* as
a person, not you as the email address, or you as the company
employee.

So I end up caring about the signature matching a key that I know is
yours, but whether the email address is then added to said key is
pretty much immaterial to me.

> PS: I saw you're playing highlander games with Linus Sebastian,
> there are still many of us left! ;)

You need to sleep with one eye open... Because you may or may not be
next on my list.

Just sayin'

                Linus "there *will* be only one" Torvalds

