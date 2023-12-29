Return-Path: <linux-gpio+bounces-1909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32A81FE84
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 10:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E54E1C21497
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 09:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91AC1096C;
	Fri, 29 Dec 2023 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9qqBWBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE510A00
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ccc34a9f90so40078181fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703841281; x=1704446081; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A120n8+ID4vVrd2b8ubQXUuU9oyVW9g833bOCNfDfsI=;
        b=C9qqBWBci47dvv+K1b+MgTwQromGf9jsiVhwLdQws5MQDmFxKkIDszZE6hZ/P+0J9C
         Qrc7d5cqeDo6BWkv3wkG4CQHIkGElfSBu/QMbFD0IgS25qYElZOMOxFAgxYkyh9UdHRT
         NQwVdcoepZCwgKszVLZ4IOt7l5QrW1lYfpC89tOkeEyqOQuj9H0NBB2IXG6V0pup3T8R
         ov3x259uuPP+igl+3rKuAFwALwyK/om39eMFrP9aymVpDL2ZfW8eBEbzYnN6kBQQPz+1
         iHV30uqbowftioONTudeoiXct2nVn/D37clAbNv0kQ4lG3r770zLZj5CtHgvH97161bd
         E/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703841281; x=1704446081;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A120n8+ID4vVrd2b8ubQXUuU9oyVW9g833bOCNfDfsI=;
        b=xRtZ6QPEHvdn6ihUX0UzPhGsg+CtbhXBz1foO2/DtpKguBAxX58JaBifKn0j45ritx
         UvBi5AQNlc8eTjKCc6mkYowX5gfLo1mTWZag9REAJ9LMtyCn1m0VqAOmSJy5q/J+uNVe
         n8Q4a2d+/Hxcj/ULMrWjLv9wKPt1mnEQsxfKQPBxd3HWSg07RnWw3uj+8sEilMhg1HCb
         XTOlZhPlGLmVE7CWasOs2LzgyO2ROGvedOPQBkOIibJ5L3vkV1i6Ir/lDh5jXpZ2qOQP
         lGGzIxZugcA2veBQn8kpvnxplrc3uXKJd5WZb/A5X3gaXMzxSFZ5Krnbq+IckFB9nve6
         sXKQ==
X-Gm-Message-State: AOJu0YzB6JiBDVE6DEYRBshnls/5y1VcwhEYcH3oztC/CVU28Z0trrBX
	UQaXKS3LYlDb/7ZMYgYiEYwdcAJ3y5pdbMKjvgcYywyTHKY=
X-Google-Smtp-Source: AGHT+IH/VXtKlayvM/zTR3X07OyQwtX3C8CBO4QpONwDTHJAo76+QnhMVt//1/mYkL82+YqMFabv/RE1kFLiDTlq2ZM=
X-Received: by 2002:a2e:b8c8:0:b0:2cc:da2a:c755 with SMTP id
 s8-20020a2eb8c8000000b002ccda2ac755mr2562185ljp.63.1703841280631; Fri, 29 Dec
 2023 01:14:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Fri, 29 Dec 2023 03:14:04 -0600
Message-ID: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
Subject: help with GPIOSET_INTERACTIVE
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'm trying to add the 'GPIOSET_INTERACTIVE' definition to 'gpioset.c':
I've installed 'libeditline-dev' and 'libedit-dev' via apt; each
separately, and then both

With 'libeditline-dev' alone I am getting the compile error:
gpioset.c:16:10: fatal error: editline/readline.h: No such file or directory
   16 | #include <editline/readline.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

With 'libedit-dev' alone (or both), I get these errors:
/usr/bin/ld: gpioset.o: in function `tab_completion':
/home/pi/libgpiod-2.1/tools/gpioset.c:732: undefined reference to
`rl_completion_matches'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:713: undefined
reference to `rl_completion_matches'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
reference to `rl_completion_matches'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
reference to `rl_attempted_completion_over'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
reference to `rl_completion_type'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
reference to `rl_completion_append_character'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
reference to `rl_line_buffer'
/usr/bin/ld: gpioset.o: in function `complete_line_id':
/home/pi/libgpiod-2.1/tools/gpioset.c:642: undefined reference to
`rl_line_buffer'
/usr/bin/ld: gpioset.o: in function `interact':
/home/pi/libgpiod-2.1/tools/gpioset.c:748: undefined reference to
`stifle_history'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:769: undefined
reference to `readline'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:853: undefined
reference to `history_list'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:855: undefined
reference to `add_history'
/usr/bin/ld: gpioset.o: in function `print_line_values':
/home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined reference to
`rl_attempted_completion_function'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined
reference to `rl_basic_word_break_characters'
/usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined
reference to `history_length'
collect2: error: ld returned 1 exit status
make: *** [Makefile:513: gpioset] Error 1

Can someone explain how to add GPIOSET_INTERACTIVE & compile successfully?

