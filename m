Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B46C715AA9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 11:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjE3JvU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 05:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjE3JvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 05:51:18 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604CF93
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 02:51:17 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4571d25d288so2756237e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685440276; x=1688032276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MXqgIqC3w+AeGI1ZRD5mBvSYzDzv3bAFXFyd0+Suxg=;
        b=MVnAiTxFoSqu1JB/DECQkZblMS42qVELzTp38+LJahVTBUQDTIT4FW3rNNFZ2+2QP9
         jkIEGznpF9Od1eYME8JzmBkJnKlczRANWgWlALVa2kTMQDA8YefFZdr+DFbOAQxazq1b
         MXdR9iIb9nKo1gDWZArkLgGApQ/7/WMYcxHAXw2Tr5iXsLSlwhjpjGsr5ivDEmG1xtyX
         n+2IbrkV1foviRPYFGtxL0kzx64GnBOOUVQHlKTcrEyyhmgmir2zj4PlurqDjYJSZhFw
         IbccGM/miV8lkjeBCO/9wXokA/+N3kSgEJqTqdnqOOsw42rvo6zxiaxwK3zaFD2chYMH
         zlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440276; x=1688032276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MXqgIqC3w+AeGI1ZRD5mBvSYzDzv3bAFXFyd0+Suxg=;
        b=Fnq7PyVMsdWf6X98KtxNIpU1zwnzRMpo63RBwWbzV3lzd9ZyCZhXoRpvWyMX4pQ+3Q
         6Dv8H9HHwr56+pQPwpCGibbRQJkU2iZ0DFv8HAkZs2t9Rzn4f5QtCGyE0ULXaCcC6aXT
         AiuChzTZhWyasa7PX9b4ZyqHtnIjr0upulUEURuu4cchXE5UOsBHCwsZOuJJKKKxoneH
         tkyxNZ3Z49oXH+Ln4cKZWjWbEgUHFqe77lYe/AR4F7r3JG24hZ0wwWGzvLTvJ5mOSvna
         BTlHygCXc3LV7P6DDjuFaYpcDyBhShFxeLN3oNuq/E32PEQtoGCiukVaOREiEBJqderE
         kFFQ==
X-Gm-Message-State: AC+VfDwFzpEJSeTdyjWtyZXRIfvNyAnqZ2taNfyqJ4OUrYV8i9K1nwfC
        qKhfeJvi4QqXBw+Yy+Mx8BlgbwSlZR0x9vOTtSPJWl7pkrYLsul5
X-Google-Smtp-Source: ACHHUZ5SsjPyMb1ZyTqPKe6wslvthJ4Kl0IaVUc38eb78kf7iZyqiBX0lsSkmLTY0ONvWr4c+1LZOWzx5zc6YsT/wJc=
X-Received: by 2002:a05:6102:11e2:b0:438:ac6e:750d with SMTP id
 e2-20020a05610211e200b00438ac6e750dmr472297vsg.21.1685440276543; Tue, 30 May
 2023 02:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 11:51:05 +0200
Message-ID: <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     "Slater, Joseph" <joe.slater@windriver.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 11:54=E2=80=AFPM Slater, Joseph
<joe.slater@windriver.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Kent Gibson <warthog618@gmail.com>
> > Sent: Wednesday, May 24, 2023 8:53 PM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays =
in toggle
> > test
> >
> > On Wed, May 24, 2023 at 02:09:45PM -0700, joe.slater@windriver.com wrot=
e:
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> > > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > toggling values.  This is not reliable, so we switch to looking for
> > > transitions from one value to another.
> > >
> >
> > That test is prone to spurious failures if either the test or gpioset g=
et delayed for
> > any reason, so good idea.
> >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > > index adbce94..977d718 100755
> > > --- a/tools/gpio-tools-test.bats
> > > +++ b/tools/gpio-tools-test.bats
> > > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> > >     [ "$VAL" =3D "$EXPECTED" ]
> > >  }
> > >
> > > +gpiosim_wait_value() {
> > > +   local OFFSET=3D$2
> > > +   local EXPECTED=3D$3
> > > +   local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > +   local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > +
> > > +   for i in {1..10} ; do
> > > +
> >       VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/v
> > alue)
> > > +           [ "$VAL" =3D "$EXPECTED" ] && return
> > > +           sleep 0.1
> > > +   done
> > > +   return 1
> > > +}
> > > +
> >
> > Not a huge fan of the loop limit and sleep period being hard coded, as =
those
> > control the time to wait, but as it is only used in the one place I can=
 live with it.
> >
> > >  gpiosim_cleanup() {
> > >     for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > >     do
> > > @@ -1567,15 +1581,15 @@ request_release_line() {
> > >     gpiosim_check_value sim0 4 0
> > >     gpiosim_check_value sim0 7 0
> > >
> > > -   sleep 1
> > > -
> > > -   gpiosim_check_value sim0 1 0
> > > +   # sleeping fixed amounts can be unreliable, so we
> > > +   # sync to the toggles
> > > +   #
> > > +   gpiosim_wait_value sim0 1 0
> > >     gpiosim_check_value sim0 4 1
> > >     gpiosim_check_value sim0 7 1
> > >
> >
> > The comment is confusing once the sleep is removed, so just drop it.
> > If you want to describe what gpiosim_wait_value() does and when it shou=
ld be
> > used then add that before the function itself.
> >
> > The test toggles the line at 1s intervals to try to improve the chances=
 of the test
> > and gpioset staying in sync.
> > Could that be reduced now, without impacting reliability?
> > (this test suite being glacial is a personal bugbear)
>
> [Slater, Joseph] I'll get rid of the comment and try the test with a shor=
ter toggle time.
> The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't th=
ink saving a
> second or two here would make much difference, though.
> Joe
>

That can't be right, are you running it on a toaster? It takes 26
seconds on my regular lenovo thinkpad laptop which is still longer
than I'd like but quite acceptable for now (though I agree it would be
great to improve it).

Bart
