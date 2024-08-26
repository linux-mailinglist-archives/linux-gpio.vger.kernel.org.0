Return-Path: <linux-gpio+bounces-9141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896795EA50
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426E5286210
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 07:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72D712C475;
	Mon, 26 Aug 2024 07:25:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B54944E;
	Mon, 26 Aug 2024 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657109; cv=none; b=WJiRbNGGNrOvJ05osPvy4HnH9pmd05JLvP3ENihDtHL9vVy9QKIo7XpWSHJRQwz0kE2sTVO701uAo6nYVmFbjDZp/wMiMZxWdW5HWpr8Iqn8m5XVK8LpsfYuifaDq+N2NVTzgNnvJxoQtC4CEFROlmcw+htrvaqJbLwUAP00nEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657109; c=relaxed/simple;
	bh=jOEWCDT7t16J4VUu/uzmgateg2rtOj7mpEr9ItcBn28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cefpSE+mA7C9U/B4iJ8acrLrQt5c4wXGYD6AOs5vGcMxfgCKD08kktm9ParRHOa0loe7vQOnH4T8KC6EZzFSOx6yS4IqKFlx6O9drxdPbh8BrjCvFpUCacF6cWqroihWnE8EE1Slxs04fAxIdWcpD/U6qahvuMHUJLcm5kJwviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b4412fac76so35905707b3.1;
        Mon, 26 Aug 2024 00:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724657106; x=1725261906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pG3NdiQQWJDN/dNcQnlcKhOctjC/jGpr1aWAQJM9dE=;
        b=azo1eXc+dE8bXyQ4mEXHnD4sg9oU5LBOxAhziIfbuyk6mBCbffun2m3QvhNaumy/9I
         +Af3K5gfoZ4rHGIPAghGQN+JPOymjQzf8vKkS8n3RrQoKKxGfmS/MhZj3L7Oest9S2YB
         IqNpoFq/4rq+LLfCvWqJeN5jmk6M/tlb5JuXImGle+RKCHb7W13N0XXQZkjFeGTe/uGA
         ztkKyhpYCRlZwihp7OFCjTB11WV90kVS7soFqdNavCa3VJpOd6jjih5qm9QRZCFT2w5G
         3yIQMAsmpXAYAH+4DAhJiuMPFI3KBSKUrrXxgdRHMF0vclzE6rFdfKVq3Mv/7/AgXSRu
         3D/A==
X-Forwarded-Encrypted: i=1; AJvYcCUBTu+npoiKBwMcLXwkLHy7OzFV3s7ob/6wXHkUiMjZbtBrlibHenXNZKNR+9azx0n3UAyFY9oTdfcN@vger.kernel.org, AJvYcCUx+v/IaAtGq5Vp4bOCRPuw6v+StuLfjVUL+wVKA36S0TRoHTBoceH7W9e+xI5INYq4phvSSJL0Vur3OnG0@vger.kernel.org, AJvYcCVxCmwUM+ir5Re1i7/5f1+vyVeh3L+qkdkVD8CJDVtmd2D7PkFvsLeHEyFP65OyV73SoYDJL0Wt5Uc6cwgAkAZ7ZpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TJakjr6JRXD+cG6q5cMEkg1sDaQe9l4MXOn5FptX8BC23+Tj
	bt53RYghsNrHD0y31BGx3XGw4l4BiIt7gtIKMqZYb+PQckzF25Z8AsCBybjL
X-Google-Smtp-Source: AGHT+IEabazbX3mwBsuKdvi68vqBhTodTpY1tkVo6HEflQj+ylwN182AgqWiuxmVBGnQ9O8cqKLrmw==
X-Received: by 2002:a05:690c:6410:b0:65f:8afe:9ba6 with SMTP id 00721157ae682-6c624fb4882mr112988427b3.14.1724657105769;
        Mon, 26 Aug 2024 00:25:05 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb5440sm14540697b3.5.2024.08.26.00.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:25:04 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b4412fac76so35905487b3.1;
        Mon, 26 Aug 2024 00:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHuZt88ch6X0J66P6trod3+Rt3wQlaRwUR+/BDHgj+U7ZAID2Htfb3DA7zjm7MayG98r2ManVmVTANHKO5@vger.kernel.org, AJvYcCVMMuHZCyIPs9txVqw0vQcTb9YSP9etBYxjVYEZkQ+c89FjakN0/mOnkxVuiuBTgYiBJndS8swlH5JQqBpofG0s/y8=@vger.kernel.org, AJvYcCXXJMVwzivoBXt8lkIg1G7agDOyXBPR7oFGA04xOLgnIeoDxuOtYa4iZgQTYdyfysx2wgJeb23nIMmj@vger.kernel.org
X-Received: by 2002:a05:690c:1d:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-6c62576b7f7mr118712727b3.18.1724657104503; Mon, 26 Aug 2024
 00:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826031550.2393-1-shenlichuan@vivo.com>
In-Reply-To: <20240826031550.2393-1-shenlichuan@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 09:24:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm_qKFXXEvGqxA9m=xvpDuJCsj=YtLeBc3RueH8zScEQ@mail.gmail.com>
Message-ID: <CAMuHMdWm_qKFXXEvGqxA9m=xvpDuJCsj=YtLeBc3RueH8zScEQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: Switch to use kmemdup_array()
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shen,

On Mon, Aug 26, 2024 at 5:16=E2=80=AFAM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:
> Let the kmemdup_array() take care about multiplication
> and possible overflows.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1 -> v2:
> * Changed subject prefix to "pinctrl: renesas: "
> * Fixed spelling mistakes
> * Adapted code formatting to linux coding style

Thanks for the update!

I had already applied a fixed version of v1 to renesas-pinctrl:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/c=
ommit/?h=3Drenesas-pinctrl-for-v6.12&id=3D5e633f572bbae9397ee50347bbe052989=
4de4137

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

