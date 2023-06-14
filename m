Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67AF7300E0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 15:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbjFNN5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 09:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236270AbjFNN5f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 09:57:35 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346E9199
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:57:35 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-543ae674f37so3644738a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686751054; x=1689343054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZBJCnGxnU8hnxF7SA3GL+lf+hsXqFqwKmT+luJzNeeE=;
        b=iZ5PzbEModQnpLX9Gnn4XTZCabajF5yQ2cQ7t+2DtSdlMiO3mKRbYU4iqcPm5Q/ONf
         2lo+3FRR3OFpH4DWUA2da+EGfGT9UKBr3MnQ1OG9fKgOxOAknKKuWoHdRSfGz6a4oX28
         JVmsU77TAWMPxPwJo1mEdUmMTMzkKQl6MGiJaQRgSo6Fh4igy3kmV6DGmDWtM9sTwzXo
         JwiVqGo6asgSRB7YvAxQPtcGJVcBNlT3t4V692/Z4oVRcvxk/orxXqiGmy0cOHijjacJ
         p3/BWphRS4yIGAHfYNiHrHxGYUGkGJS3jRAj5Uv/NkOAqqmEFS+gqoW/fNay359kZuJS
         LpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751054; x=1689343054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBJCnGxnU8hnxF7SA3GL+lf+hsXqFqwKmT+luJzNeeE=;
        b=kH3/YYQVoRR/pPZES4Xe++z6n9b0XlePkah1oVsrGS+YZUpgD2yW8eyKEzc0aA1UWo
         At++Hb9hvMG/0Kr5SRs/35cGAbKoBYqLhhoYrhbZxahMH+CRr/0wCL9EGLleX5/oMitb
         VVs50xces26rK9XUpUmXG8ntGrgsMfiuqgrt8VCTtiGmn8tZyYPXMilnlLqhUm1fSECU
         54TFsh4nanQXMw4OV60aYOm9GQ/EKNkAz+VaeUGfCPsNrdVRQg6PBF01mkYaMPBPG1KB
         ckfpXy1dJ40YV46kwer5lfDPYlis5jtssZMzq/IHeIlXxOAH6VFxBtK069XlemM9Qvzc
         sxFg==
X-Gm-Message-State: AC+VfDzN24liwP/IDifRchRgTHUgZG7DLOhHiH3tkG7oCTdBNbmclojy
        LlkyVVyq9OD1j14TtY90XrMuXOfIKHo=
X-Google-Smtp-Source: ACHHUZ7qL3NdjOvF2EZoxnaK3W14z/nEVakjVy3vbmEZ6Bk31EmcjOqgKaY795X5J8voB3DC6UPmRg==
X-Received: by 2002:a17:902:a58c:b0:1b3:edae:8825 with SMTP id az12-20020a170902a58c00b001b3edae8825mr3620614plb.62.1686751054570;
        Wed, 14 Jun 2023 06:57:34 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902778600b001a1b66af22fsm12253469pll.62.2023.06.14.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:57:34 -0700 (PDT)
Date:   Wed, 14 Jun 2023 21:57:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
Message-ID: <ZInHSgsfALvbTmAX@sol>
References: <20230614035426.15097-1-warthog618@gmail.com>
 <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol>
 <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 03:26:54PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 14, 2023 at 3:21 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jun 14, 2023 at 03:03:51PM +0200, Bartosz Golaszewski wrote:
> > > >
> > >
> > > Great idea! I applied patches 1-3 with some tweaks (coding style, C++
> > > comments, statify functions, put local functions into anonymous
> > > namespaces for C++, apply black to python code etc. etc.).
> > >


Any opinions on where to go next?
Other use cases to add - e.g. multi-line versions?
Convert the tool examples to use case examples?  Or do you still want
to distribute the binaries for those?
Any functionality to add to libgpiod?

 Cheers,
 Kent.
