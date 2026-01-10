Return-Path: <linux-gpio+bounces-30386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF09D0D6DB
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 15:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C1DE30021FE
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 14:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E41346797;
	Sat, 10 Jan 2026 14:04:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B833446AB
	for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768053854; cv=none; b=NTYPPNgFy/hSfZcuggluPWmoLOud+wyWwnBUaGKkHL5r/qQDFnJq5oMxDQFSJE9zqqoOj/aMh/zZtknJo0lkfzLQ5bWRTjbggb2t8cZbtuPgRehEoqL8yEQZRkqhEgiSmtQt340isgYnMLrAdnwT2SJ43zY6Dye2PlUqyDy3+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768053854; c=relaxed/simple;
	bh=tKasUzgnJ5tHsB/zNtMovFVLfO8KZhfIR8BiYuhSUK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JB+9hSrkIxLMV6uiepjsOjIszsEJlUHVJkIFi9281hUetK5uo0zAIuKMmCL4m5IljXTmgXXiKcl8UZpGoE72gYrR4SqoQ0NfsJcdcIjr80n+mHx7w2cLZVvpfwi5912qvL1/DEbDL2ao1UawyaCwqX1ucl0kE+JEMDf5kY6qhoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f67.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso1577721241.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 06:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768053852; x=1768658652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zesx+EQcmeyquMdpinrRlA/4MSp1GKSwu+RTgtqJFw=;
        b=pclpn7BioSBU9bRgrsLncOD7MjDqjExgodgzaG/k7L54kCg+mHfKTL2STUwzTycfW/
         trANc33621+m9eO7LY8JPsuR7hzrrKFe9QJnT+7nwcT2P6UsdbM0eEgsIE0rDcv5zvST
         pjqC38Y35BehCDzi1d3T6aLCo8Q4dNyaJqiQrqmleFexAIk+mzKUiy0oE2FTOWnqCJgI
         +JRoSoFPU6Lk8ZxQOKEGj9uxcHmNDlguFEF8aCIsddTGkp6V4q9VJNG6b6mWva1fPq/E
         9Gf/sa9D//JaFurym2S8bwGoN7bXUu0JFkZHQeCDHTeKO1uxyV5u/Z/cPo/0FlRqCvvy
         YCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWADpUa4o1Qvh8mFnqaARjGytFJgxCKf1KsotBWeCct9OULDboTNCk4AE6IOVr7fvd4Xg/GEZYI7bS9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHo9Wwfay95XfL8ZZbfs41y6e4VFtzmI1B4uVS0gtyMUaj62ch
	yJrhK+aIF/xrlreZED7SAvF2MWB7XmRVarWNQQ4Wos6y8YYbBcddsdEbyr2N6RRV
X-Gm-Gg: AY/fxX7y9+eDZw0ZiebC+YZ6X+Lx0Bx3KHxu7/LmgAcFEYqRJ6AO9evG5JvUl/bZw3B
	zHUXdEr33omcCTYryGDSS139X7SrZGTZLjOoIlfN6pGFkZsB3h5kGdjItD08JeDI4RHWOPGZVfu
	NtLY+9VCIVdhYjpeJBSlGQNjzWEhdkecuea2/Ye+V8OkkAjqjhiB3Vb+I1/rwyrwz6BQ7muHgJB
	Dd6guAmIOu5kxVbASq3ttqvwxPhLJ9cm1Z9ZW/i/vjwUPR62THCslkpD7k43NyJu8L57cZa5gL2
	wfRkStBGgyrpBk2uiwVcTVyDzrYxlNCnD5o1oLeUmjlENS6vg1M7Wl6/7L+pBH/HgCjzwMS1gTy
	okv17fg7xc8yDfdk0ydvaBvziihirlWFn65xVSdDLQa8WMMrfQSxPmbBavyye2UfJRCSt4I0fDS
	/xahjvHbZ/YCWT8bUsZ/8oAW2+J9pcjTaD+fAdilknTOxqc5n7i5Xn
X-Google-Smtp-Source: AGHT+IFmfVyeGvlGX1hEuwHCT6Ib55sATRItuhDg5KrigC9G1fCzpZR+CmP4WdQhs1ls8duTsT/Upw==
X-Received: by 2002:a05:6102:568c:b0:5db:f031:84d6 with SMTP id ada2fe7eead31-5ecb69424bfmr5454472137.28.1768053850669;
        Sat, 10 Jan 2026 06:04:10 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772af325sm12570092137.10.2026.01.10.06.04.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:04:10 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55999cc2a87so1427640e0c.0
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 06:04:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZeZN+MjVlVMq9Nggld8VTpncpCb/yVirYktJiphs/UXIogrY3zEo6SItAEMf235K5BQ8CaZa9rNQp@vger.kernel.org
X-Received: by 2002:a05:6122:c86:b0:53c:6d68:1cce with SMTP id
 71dfb90a1353d-56347fcbaefmr4885900e0c.16.1768053850063; Sat, 10 Jan 2026
 06:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109134409.2153333-1-shorne@gmail.com> <20260109134409.2153333-2-shorne@gmail.com>
In-Reply-To: <20260109134409.2153333-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 10 Jan 2026 15:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNht25_gY-R8tw9x__a-aRv6ZfKULPkUHrsc7jokizQw@mail.gmail.com>
X-Gm-Features: AZwV_QgHRb84PPZ39iYbXQZP7JLVIPbd6lMKcY-W8c8LRRN13vbxER2EwLDZPl4
Message-ID: <CAMuHMdWNht25_gY-R8tw9x__a-aRv6ZfKULPkUHrsc7jokizQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] gpio: mmio: Add compatible for opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 14:48, Stafford Horne <shorne@gmail.com> wrote:
> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl.  This is compatible with the gpio-mmio.  Add
> the compatible string to allow probing this driver from the devicetree.
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

