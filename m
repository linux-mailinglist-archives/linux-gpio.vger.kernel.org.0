Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5A5600E5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 15:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiF2M4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 08:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiF2M4Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 08:56:16 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D4B2E9E0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:56:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eq6so22034505edb.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xO7VyvIMRvqyxWPNeiNAKwSkFextliwxIBvN7ubYAac=;
        b=axTqnS0sRHEJiqi5rsTSRNEPtjEyBzD3wZ7wBvkp+Msq0wJuMEhaWSSR78SA5GgxIC
         eV1Qv8cqZsip0/3JxKatu8dv5jQPEqX+Q3/4jggWD7t8lzzvBO4t8UmN50zb2aniy6De
         vJP9Pp6UpaEOQ8DbbNr6tvXvoGdSMw//+syDOXsjy9eIVtmqZaLMcDDN1SyACtMeXESZ
         vI+9k4uBIV5J8r6fUkqpRMe5cLtSt5l1MwgqcnyZ5+bHPYLcQGr5oBHRNbIA727oFkuq
         GYhfFwZ+2s8eJ96QNg6I0IGpVyC8pyxRR947KwZ8gdfVw4S4OvdmtkYIMoEyuMesGlEw
         AL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xO7VyvIMRvqyxWPNeiNAKwSkFextliwxIBvN7ubYAac=;
        b=FxtiGVPC1Rx3JsK8Lmd40T6ULgANwESf2FrUhvERjBOM4zbPqpqpqtyGTO6rBV0Qio
         0MRRqt+Xqv0ORHruJm55m3DqMNAMommYKYsYvpveVjBVK+0YMsqcWxq11oy9d/Z2ORSY
         EEqjUM1LBakECgi1LkGdmMVDq0y+YwE/z5kL4FgE6I2fcesFmcVEWSzU4+FwMklmZIef
         EFvuXmqLr5YdxgFN7Kmh95Mp8ETUZ5Puhfz3jRSmdDRDXUbJHYQ8sTS+Z1jVOHploxmX
         B4nQiWcVa+u2pttt3oDwTOA2NjgMV+B6SZEfHnhirIzEhT1vA5lpXPty2REH4vfUOPMO
         MRew==
X-Gm-Message-State: AJIora+GhYUDPqmKYwzxCJcWbvGmA0QfZSIrkFpchwUXnmIf0rfF9xFS
        NhxyZG4jmV/aU22O6mplcpb3jfmmhat/bRgrv7A5yU7B4L0=
X-Google-Smtp-Source: AGRyM1u+H/H5FsJnzLKXMCQPJAgAs8x98V9EHVzFi6tv83oavT20BU3hAmv1eroBoUEIzkl+igQbxCAtM+4WBhbYo6E=
X-Received: by 2002:a05:6402:18:b0:435:9a79:9a40 with SMTP id
 d24-20020a056402001800b004359a799a40mr3988491edu.328.1656507373820; Wed, 29
 Jun 2022 05:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol> <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol> <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol> <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol> <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol> <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
In-Reply-To: <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 29 Jun 2022 14:56:03 +0200
Message-ID: <CAMRc=MeS6MhcN7+58F4Hh5R9ZZjAFxiJO594_iuSTFrDUUbKaA@mail.gmail.com>
Subject: Re: [libgpiod] feature request: output state read and sustain
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Wed, Jun 29, 2022 at 12:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 29, 2022 at 12:48 PM Kent Gibson <warthog618@gmail.com> wrote=
:
> > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jun 29, 2022 at 11:27 AM Ji=C5=99=C3=AD Prchal <jiri.prchal@a=
ksignal.cz> wrote:
>
> ...
>
> > > Do not use shell. Use proper programming language that may give you a=
n
> > > easier way of handling this, i.e. _context_. Shell tools are
> > > _context-less_ and here is the problem you are trying to solve, but
> > > from the wrong end.
> >
> > Actually my proposed gpioset for v2 will support running interactively
> > so it can maintain context and be driven from shell - for cases where
> > basic scripting will suffice.
>
> Dunno if it's the right direction and if I missed any (additional) discus=
sion.
> As far as I remember the idea was to introduce DBus aware daemon that
> should handle the context of the line and at the same time consider secur=
ity

And it's still very much on the roadmap.

> implications. Allowing shell to be context-aware is a hidden mine
> field. What will happen if the script/user forgets to move the line to
> the proper state and the chip will drain a lot of current? So, at
> least PM concerns just popped up immediately to my mind. What else can
> be problematic? So, I dunno, it's a good idea to allow shell to leave
> a line in some state when the user actually doesn't care about it
> anymore. At the bare minimum this mustn't be default behaviour.
>

It's not much different from letting your current gpioset run in the
background, is it?

Kent just submitted his first version of gpioset, you can take a look
at it and review it. :)

Bart

> --
> With Best Regards,
> Andy Shevchenko
