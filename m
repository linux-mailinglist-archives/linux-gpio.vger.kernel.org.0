Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7D7163F1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 16:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjE3OZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 10:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbjE3OZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 10:25:03 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96133199B
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:24:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b05d0bc2bfso6106675ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685456646; x=1688048646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NKz/Vx4yRb6qCBw9JjQBFhxFdarZWUn6/4M2esv5vXs=;
        b=C7wY4FwIWYP8sB0h3YRiNz4Mb7aMt7P7FUTxLd+rQFTUYJ+Mng6n4DSxP/0QqcUHba
         5xYNESvTcLN7puLr1CULHcWeZgcZ823QU7iqbxJ1+tKEceG5Zb9Q6gFY+US8gMStJHZi
         Jtq2S2amlA5gFVw/H4cl+mEBhF4rrp2hLrGxRk5j2Ptm6CK5PBaUkvAyTn6aBjO681gS
         bxosoFB80KwxTPBjGjsFT+elB1giB6H/JlmSncGZV7QcQmapAIEin8yKvbUjqgA75nUX
         hemd1uwNVHTxgbOjSzCPAyXV5kYjph0ssztyBF6VOrI3WM1laKmcL2VHKnz6au/ZmEho
         Rc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456646; x=1688048646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKz/Vx4yRb6qCBw9JjQBFhxFdarZWUn6/4M2esv5vXs=;
        b=YpqpN8wFUJ1bJ2BC/Rqt7FiwW4zGtfgaq1eUEI7eJjtm2g3vAoZ28MdvgXml08muEb
         u6ow+aK+9paGhIDIL7mV7Lk/+qAk9rOPwfDi7VGviuOz5KH7M/rPUk6AOrjMENjYnYgX
         JvRtlczxANqp3EwnR5Gsu7lHe77GSfKDIPg3b4HkYGZaHKjBKX6lY5BfrIzVcL8kBHrd
         vTyvdf50q320qYyW8BrOYMJH1lsZXbSlYHQL77TMHsyLAF2kn3Dv4VmgEIrE6g9Wf0km
         EgaR0wf/wG8pPt6w4b1IS19kWDOnhX8snlmMYWpbQrv1qATfxvoKLNP2xJW9RqZfjPq4
         1fUw==
X-Gm-Message-State: AC+VfDyRmuVsyEvtTGwTiWGlLWjpszei601pl3gu2eJsQtKaAbi0zJo7
        FSU662Xt5jyKeLy/OZHyqHuSu35iGEw=
X-Google-Smtp-Source: ACHHUZ6ltpKuX2gm6dwqbXukhWo4z3qw5pduS80m6vJD/UsZ+qdGcR0TIH8Z4XNdYThx/bWwyVbUYg==
X-Received: by 2002:a17:902:bd88:b0:1a6:b496:4053 with SMTP id q8-20020a170902bd8800b001a6b4964053mr2048374pls.59.1685456646181;
        Tue, 30 May 2023 07:24:06 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001a69c1c78e7sm10357924plg.71.2023.05.30.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:24:05 -0700 (PDT)
Date:   Tue, 30 May 2023 22:24:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZHYHAXLPwX0C7aTK@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
 <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol>
 <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 30, 2023 at 12:05 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, May 25, 2023 at 11:54 PM Slater, Joseph
> > > <joe.slater@windriver.com> wrote:
> > > >
> > > >
> > > > [Slater, Joseph] I'll get rid of the comment and try the test with a shorter toggle time.
> > > > The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't think saving a
> > > > second or two here would make much difference, though.
> > > > Joe
> > > >
> > >
> > > That can't be right, are you running it on a toaster? It takes 26
> > > seconds on my regular lenovo thinkpad laptop which is still longer
> > > than I'd like but quite acceptable for now (though I agree it would be
> > > great to improve it).
> > >
> >
> > Consider yourself blessed.
> > I just got:
> >
> > real    2m25.956s
> >
> > on my test VM.
> > Not sure exactly what the hold up is - it isn't using much CPU, or any
> > other resources AFAICT.
> > Compared to all the other test suites I run, this is far and away the
> > slowest, especially since switching everything over to gpio-sim.
> 
> I agree it's too slow - be it 20 seconds or 2 minutes. But similarly
> to you - it's very low on my TODO list as I only run it every once in
> a while. I'd be happy to accept any patches improving the situation of
> course.
> 

Same.  I already had a go at streamlining the tests when I updated them
for v2, so it is somewhat better than it was, but it is still painfully
slow for me.
To improve further I'd have to start digging around to see what bats is
up to.  Speaking of which, do we need to stick with bats?
I've driven similar tests with Python in the past, and I'm sure that
would provide a better experience.
What constraints do we have?

Cheers,
Kent.
