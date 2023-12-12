Return-Path: <linux-gpio+bounces-1317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7C80F406
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 18:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B77281BE4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 17:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA2E7B3C1;
	Tue, 12 Dec 2023 17:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmNW4hkB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4BC8F
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 09:07:06 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d9f879f784so3099189a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 09:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400825; x=1703005625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qyp/xcwXJAh5WYkVbpddBlHbrFJQdwFRkjjvlIdkFnY=;
        b=cmNW4hkB3ligBDsECZp1uNm5zx5hRphEI4SZpkHDz4fF6VFCT+w3OFKsBpvbDVdnC2
         05zfn86ThDTL+BTs6DNbLDSgXRhEx5m86TBGLX0egpHD5wG59KIO6JicHNdSr5yNCwi9
         g/dbdAikvXP4Qb2iRoq+CMDd90wue0eN+r5Dg889e8jtHv2QfCYBBNPrah2abrz9YPrw
         F8e+c7xv1hhXPaZqMIWYhc8u2M9f+Py77FZR5DTu/eWK7qbozq3wppgleAqAjvjPb2W0
         An3QfIVsGVsUjaRp7pV26imIFuTkDxQ3HzQ2K7nHAN95Vsbf1L+gIlrB8SFo3ZJtFvTg
         b7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400825; x=1703005625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyp/xcwXJAh5WYkVbpddBlHbrFJQdwFRkjjvlIdkFnY=;
        b=KmpHU1+hdMGDfee5T3VcTzl+IBatKNMoCtwj8gqRLijf1lMnrul/uJPajrw1zQ8gNF
         vkvJJKcit+GED6peu0NjDmcavUpVYni6CImLjbFRssLbqu4OS3j2RItnrcteddvk7Ztr
         FlmfUMifejq7jC02a5rqDMyjOgHtII/XF5w7zyU9/Eeb8mntuqlr2+F6jHROCRPVUWTK
         zC3RCDC8kxWlOAEHITQB6HO/vf0rO6Od0pYknG0+uIqUIX/pNPLKYM5qKbpofjla0h6y
         2Cvn0hbpHQ5zZ9Q89c7kyLrB8+hD6ye26MCbuyEsH1Nosb16bT/5b8tiPGK/9ekGYVMl
         Z0wQ==
X-Gm-Message-State: AOJu0Yx06b2CG8WzhXQDY5+z0++d2PVjWQJVRd69KKR6bHMXMuoPlPxc
	Xv4AOFp20tc4z0cv6bNa47Brpa8Foxweip4RzJ0=
X-Google-Smtp-Source: AGHT+IHNCA2hvwbmESkAshsIUU2GZovKv/zIm/f910RUh+s5UA+IUjEp2Q2tC/Y4KaMN+9iYXWN016fqNImrbzb8y84=
X-Received: by 2002:a9d:69d2:0:b0:6d9:a81b:3735 with SMTP id
 v18-20020a9d69d2000000b006d9a81b3735mr7446328oto.45.1702400825284; Tue, 12
 Dec 2023 09:07:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com> <ZXiEBXWFVmz_cmdM@rigel>
In-Reply-To: <ZXiEBXWFVmz_cmdM@rigel>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Tue, 12 Dec 2023 18:06:54 +0100
Message-ID: <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
Subject: Re: [libgpiod] - fast writing while waiting for edge events
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Kent,
> Don't top reply - reply inline instead.
Sorry, still new here.

> Firstly, as noted, if you are talking separate requests then they are
> separate objects and you can do what you like.  So have one request for
> your PWM edge generator and another for the lines to read/write.
It doesn't add much, but just to clarify, the PWM signal is not
generated through libgpiod, I only use line requests to read lines and
edge events.

> In the current implementation, the gpiod_line_request object is immutable
> so it is safe to access it from multiple threads.
Thanks for giving insights into the current implementation. Knowing
this opens up a lot of easier options for synchronization, for example
synchronizing only writes (maybe not even necessary).

> Or it may be a defensive measure - in case
> a future change makes a currently immutable object mutable.
However, I also understand that the restrictive nature of the
documentation could presumably be designed for changes in the future.

Due to this I am a bit undecided whether I should base the C# binding
on the current implementation, but there is probably not much else
left for me. Even creating a separate request object for every
individual line would not fully solve the problem to be quick in
reading edge events and reading/writing lines of the same request
object, while adhering to the restrictions of the current
documentation.

Regards,
Mathias

