Return-Path: <linux-gpio+bounces-660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA37FD58A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 12:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D775C1C21006
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4721C69F;
	Wed, 29 Nov 2023 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnTgQ1Ej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C202826B7
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 03:24:05 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7c461a8684fso1654257241.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 03:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701257045; x=1701861845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy/+T92MMQLqgInsqyqPERTmKim1Fctk9KTDK3z3N0o=;
        b=mnTgQ1Ejc9S5oeYno1f2MiMqLbbQO+lesgry/NK/Xq5M8p1kVA/Ubirm+hqTG2Ff2w
         FSrJctSDdTtI1vaa3B15ZncXSKuPfWhEcd5cV1gVpMMQhrwK7TMwy2yBAl1qzIX7RIhv
         uThxbsqD+Rn7pvrr5YCPSiwFKQ3hb92j/8sjNmPuobuGIZXx21hTH35mOtHvdIhxce7u
         YzUSnZdxPgD2zdGO0oys/lnf00nALSowlY+PGyBLTg1sx3yN//V7/hT8z9aglrxVrnbc
         RQj+iQaEa8qN6h2ImW4BnUFlPDuGFwm63EFqiCG0302iYmM1Mc7EShCC/SwB0YlZY/ga
         KSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257045; x=1701861845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy/+T92MMQLqgInsqyqPERTmKim1Fctk9KTDK3z3N0o=;
        b=ko8Px7cuDecBb9aeIMbntOw7qRZjW9IbfaSKzVCvCHVIn53IRnSP5pVKuW4qYEA3jK
         UsNY46/BfJPJgkINQv33pXN8uxes0fkptVjdd2xgIDuUxM7V98fAXlEQvY/9cbMR+Kp9
         LO1tWXgVDd2llOOg8QvDaE+0aCTlSPjqL6YJwWvY1h4GeWRG26O7VvtFZSz5LnmQv+qp
         VTCjCTCIbU3+OPQqqYOPrYkZ2lSKkMH7QFWT1noyWNQ2MEhaUIpI4s60J6SRrCfbwfg+
         vQcrzOMiVVbi4rL3RggISnVP3kMmpMSYRicLTbp6/45ty8UW0tRec/08Q5h+A+Duojbd
         sM1A==
X-Gm-Message-State: AOJu0YzAGF5wfKSmr4uGyrW76IDKn9YCSXBFLyFZtUgTzOp/xMYbZMq3
	6yVWF8Tr5K3VhhUt5ZQKgtN+nUCtbz8Q5L4GdK0=
X-Google-Smtp-Source: AGHT+IEt65AJhZStSEl9jTvhvvrdoRTNYvE+Ls9rJdbUxdLcVpCs9vTbF44oyDhklKtEbNNFgFf8I4aTeZCSUMSEqyU=
X-Received: by 2002:a67:ef97:0:b0:464:3c0a:fdee with SMTP id
 r23-20020a67ef97000000b004643c0afdeemr4261859vsp.5.1701257044816; Wed, 29 Nov
 2023 03:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com>
 <CXB4K7SKB60P.3HQ6SAERTVNGW@ablu-work>
In-Reply-To: <CXB4K7SKB60P.3HQ6SAERTVNGW@ablu-work>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Wed, 29 Nov 2023 12:23:55 +0100
Message-ID: <CAEydidmUAZAo=8ni+idu20U-5LnSg8CFvaVRPyts=p2pPthxYg@mail.gmail.com>
Subject: Re: libgpiod - stop waiting for events after request released
To: Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Erik!
Thanks for the clarification and pointing me to the aspect of thread awareness.
In the link to gpiod.h 2.1 you provided, it says: "Different,
standalone objects can safely be used concurrently. Most libgpiod
objects are standalone."
There exists a warning annotation about thread safety on these 2 methods
1. gpiod_info_event_get_line_info
2. gpiod_edge_event_buffer_get_event

 I try not to violate thread contracts, but in order to ensure that I
have to know which object can deal with concurrency and which not. You
mentioned the line_request being unsafe against multiple threads...
did you have to go through the code to find that out, or is this maybe
implicit knowledge?

Regarding the solution about my original problem: So I guess that
would replace the usage of gpiod_line_request_wait_edge_events
completely, right?
I would have to get the fd, poll and read events (interpret structure
and so on) from it and write exit signals to it? I am not a native C
dev, so that would be quite a task for me... I think I might just fix
threading access, to have only 1 thread access an object at a time,
and then live with using timeouts on test shutdown :)

Mathias

