Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61454765DDC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 23:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjG0VRq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 17:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG0VRp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 17:17:45 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598B22D7D
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:17:44 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5227e5d9d96so1801512a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690492663; x=1691097463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEyifT3ml0plJLQ/PIh82ZW96eQUc0zis9PUUAVs56I=;
        b=BLSvmZOkr3xvzp53xj5crvHhoSPcHaT4AOBlu+ND9Gru+Ekd+d1Noc+NP2xMmC+C/l
         h2Sf5ZHueqSh/37a9yn3zXAY+1jz87ZA/gg/6FK60/ub8j4NBL3VWZsWS/6RLoIaeARO
         MdJgzGZvXBruGyzPy31aE4mi1tSykHykcz5OtO1VLgAMC12A0KAsFVU+lWQ37nlfTq5T
         Jz+cw6b6CXvr9zwI5d7DPBfCMFdrYMS9N9QXnp9PZeMfd9nIQFvFzI52YcO9BDv9E6X6
         HmLfvI4dVGdw8NR1nFPxFYlZ/6UxIeEo61OESIhqSYOs0th3CIH0KggspN5SuJp5Vyqm
         hJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690492663; x=1691097463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEyifT3ml0plJLQ/PIh82ZW96eQUc0zis9PUUAVs56I=;
        b=NIkDg6IcEDGMWO3JHI45HTkYZVdy+F8RqtX5KF361+YlLil0e2cAzrqQ7xQ5qawFVz
         tkGc8qO/vkxfld8rsUbC439kqCsRhws7w4P69SOejF5F5sH4GLQINSb3R4xfOhSRH62L
         iN2qJlvg9S9L8yHGLIdnhD0abiadq54ANUxkMEuEBkjc4kHXPfEKydjweXoJWCh5ZIWm
         urIWG4ciKaVtfyaTRG8AtxmJF4PMSwMnMqxbjiOhWbplMuEkXwbPRoRlLEpAfM0NCQNp
         fpvuNpL1XmJMchc/JC3wSY8k5wVmFy8vylf/JGnn/sJkFh/7xt31YVeA1y9BhBR3Dsyl
         CCTA==
X-Gm-Message-State: ABy/qLYjGtOrf0R9QYAZDAEq5P+WbwoHkem8TGFhwjcLUfsfl1ERPw+C
        CdF/QD6nA8toveFmBl++DsP2FHIE8BVlnvGFWL0EA/24
X-Google-Smtp-Source: APBJJlHNQjDodO9aPVtMIQPnRNKLXZ8owJjF881IP2ZenMm6WgycpqY1o5QI7cpgUWOGdNEvEz5MBCQvwM51au0dETg=
X-Received: by 2002:aa7:dcc6:0:b0:51e:2a1b:6de with SMTP id
 w6-20020aa7dcc6000000b0051e2a1b06demr88518edu.40.1690492662535; Thu, 27 Jul
 2023 14:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
In-Reply-To: <ZMLZSqRwrPfKEbX3@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Thu, 27 Jul 2023 22:17:05 +0100
Message-ID: <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 27 Jul 2023 at 21:54, Kent Gibson <warthog618@gmail.com> wrote:

> That is not how the line_bulk API is used.
> You don't request the lines separately and then add them to the bulk,
> you add them to the bulk then request them with
> gpiod_line_request_bulk_input(), or one of the other
> gpiod_line_request_bulk_XXX() functions.

I did try that way first, but it didn't seem to be working for me.
I am currently upgrading the system to Bookworm (gpiod v1.6) to try again.

> Btw, the primary use case for the bulk is for when you need to perform
> operations on a set of lines as simultaneously as possible.

I am trying to do things as quickly as possible on a predetermined set
of lines.
I am experimenting with gpiod as a replacement for an existing (and
no-longer-working) driver that is part of LinuxCNC.

I suspect that gpiod won't be fast enough, ideally I would like to be
able to write to 15 IO lines in 15=C2=B5s. (because the code will run in a
realtime thread which can't overrun)
(There are other reasons that it might not work too, you can probably
think of more than I can)

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
