Return-Path: <linux-gpio+bounces-1354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6F81121E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790A11F21399
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8312943C;
	Wed, 13 Dec 2023 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpEOavws"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C682133
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 04:52:59 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7cac4a9c5b5so1743502241.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 04:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702471978; x=1703076778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk5/fDQKFZ0LzXASIRfwqwM6+PYdYriV/a0Lrst2DOI=;
        b=dpEOavwsGmy/w5VVXnPM9HykkMs2jAOaC9RZ5klYbOsxLztmaZ93/D/YFjQdc/x2rm
         modocra68fbP73fMnBnluk2+23MR2zfrCSeXDL0xWrEmYHxCHs/Stofnz50YWpvBw9JT
         wyZGzon1PaedYHGM2+9D/wEQ1U5o5ZPo5t9vA1kvTHCg856Vt7DMcGti8LtSkQKiW8jP
         hgWTjqsHzYZ981Ulyk/xHOSRYPuMiurkASoLWtmmFc3l1rqev+IAnk1Q9gCmizRg2DHz
         4lPXMJVatSoPo+LpwvRDn3toOaMQbC+XK6FlucXzMqtzkZsRf+TFSm7sN0qVd/LJn9k2
         nJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702471978; x=1703076778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vk5/fDQKFZ0LzXASIRfwqwM6+PYdYriV/a0Lrst2DOI=;
        b=sPtSgC6RfPI/PNvCkQggPXwbEZUBgfk27OKHOSNgdBhhqZGnr6weejyJL07PCqPbq0
         3nw5jJ9f1Wboml4l7W1G0TawVCglLYtyP6dDHj0eErtx04FflNdphG99DUXO5bfbXrqW
         kkFTWlZ89gkMe9SJ6FHv8mbu8LY9Xzw0a/JZRcUe2uOEkGvW1Z8NjaiQpa0UD1fL3gVd
         CVPrw+JoC5MaCi7R4tTnvX4C6S7R3puq7vXeWU6f1fd2OptyOrQt0d9AK4LYpPqrK/mV
         dDpVdtt6SXkp4p07CBwWlc5K9bo93020kSsviZYHEmTMvDtZ222xLR3J+nitNZgalQpf
         BOOQ==
X-Gm-Message-State: AOJu0YxtlF3KpUbHxBUfpoLxMrgRCP8AkcZ0H8VYLOXlkPRp/OF/4M+W
	UCm14uH4typgCAQXabGqRz3liw/yTqKPDs+7LME=
X-Google-Smtp-Source: AGHT+IFCh8hy5Ac8E93K4/U0dloRcseJoLEJBWNu00O78sfCDoEZUGp1eKWmf8cuQtlRpmTlFihcMAMkT/HJBylWFYI=
X-Received: by 2002:a05:6102:b13:b0:464:4676:ec98 with SMTP id
 b19-20020a0561020b1300b004644676ec98mr5857154vst.7.1702471978103; Wed, 13 Dec
 2023 04:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
 <ZXiEBXWFVmz_cmdM@rigel> <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
 <ZXkD7f5GUZ2WWfoD@rigel> <CAEydid=UvfRZMHRVRgXs0dtc4p72exc-h6Bs00OHsp3+zsS8XA@mail.gmail.com>
 <ZXma2gzOkbjawsH2@rigel>
In-Reply-To: <ZXma2gzOkbjawsH2@rigel>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Wed, 13 Dec 2023 13:52:47 +0100
Message-ID: <CAEydid=fgJNfmx41HLdaf27oa+5QWqqVr69DgiQHGaxfy95P7Q@mail.gmail.com>
Subject: Re: [libgpiod] - fast writing while waiting for edge events
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Firstly note that you cannot lose edge events. They are queued in the
> kernel in case userspace is a bit busy.  It is still possible to overflow
> the queue, but it takes serious effort.  You can check the seqnos in the
> events to detect an overflow.

I think the only thing that is lost is my memory sometimes.

> It is also a bit odd to be monitoring a line for edges AND polling it
> at the same time.  You get edge events when it changes value, so polling
> between edges is redundant.

Yeah, I might have to rethink my usage there...

> Though if you are using a libgpiod function to perform the wait you are
> still stuck, as going by the documentation you have to prevent other
> access while you are waiting....

> So you have to not use a libgpiod function and wait by poll()ing the
> request fd.
> At that point you may as well wait on both requests in the one thread.
> And then you don't need the mutex as you only have one thread accessing the
> requests.

I see. So that means waiting on the request fd is not affected by the
threading contract?
Thanks for your help.

Mathias

