Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8963C6341F3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 17:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiKVQzx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 11:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbiKVQzr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 11:55:47 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EEB74CFC
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 08:55:44 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id y83so1444361yby.12
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 08:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+wyrIxhqHk31ol2o5xCMlBzrVjD6BuPwf4Pvlc7OOo=;
        b=Gl5e6DzSmBq+DT18ZygzRYc1yfAYeADEv8y/kyd6t1EG8UUWPdpdZPLmTINYqQ90/7
         5I4/qpCE0RlbV5o9KfybYtbfnPdY6HMn81TyjtLrvsq3K/A0LmQEC6YAz/7m781FLMWg
         pvLOBVjqqFDgbaYHYPv0shpTJttLIrBWv3Fs9428XZLFPLOdFm+I8APwwUCUpjFJDyeL
         K2CQDYUsWLZ8552ceuVz3qTkkVpKhRl+d9qSpDv37Qnkc2uka/x6ryYqGaffEA6rkerQ
         +mIjYKEzg1AZ6ESPEYfnl/B3lPp8O9ti6iD99la9k2470pMvNJIKAcekUW8LIS0EH9KM
         8MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+wyrIxhqHk31ol2o5xCMlBzrVjD6BuPwf4Pvlc7OOo=;
        b=ORgEW1NREzrPueHYQseULRddIXuwvcio6Y2u48jvDKIlnV24mCCaBhQubKGilboHXo
         tQR9GoDhZkLDuwROv0rnILMm41Y3zG5LEl0cNe0/YZisup4HRJVHg3iufktZ/6QjaC8K
         zfJv85kCvsa7rWxM0N+JsnxjIgVehwJo/26SZynWLYnNcmhKMy2ysqx1+D7q67zy7Yzb
         sSB6BYbwFji7QEemw8K2cf6MeJUOdbPJ/zAYkV0iFjKWqjBEDoG9ilkdDn/70U+v8CJA
         dLeQpq2mzaUjRwoPZf2EIvJURJR3Eji5OWC+miuBoxt3+B383mGL59cHz2AorfOJNYYT
         WOjQ==
X-Gm-Message-State: ANoB5pkkw9x6JBV0VZxORHlOB02z3wbcPPCHgxHoSmQQF5irFzvT+rDW
        2+NCGZn/ciHFCzJkz7HTNrwBWms1dd+pBfA71hM=
X-Google-Smtp-Source: AA0mqf5DuApDAx+uJn7dwnthMVdmgxn4cbaHW3Pw7+IeR9J6+ezqrAErNXwDpyHFqMDcXop9siljUIq5ZUIhixRN13c=
X-Received: by 2002:a25:44c5:0:b0:6cb:16d0:1ae1 with SMTP id
 r188-20020a2544c5000000b006cb16d01ae1mr4166885yba.581.1669136143547; Tue, 22
 Nov 2022 08:55:43 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
In-Reply-To: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 22 Nov 2022 17:55:32 +0100
Message-ID: <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> ---
> The expression that defines the value of an enumeration constant shall
> be an integer constant expression that has a value representable as an
> int.
> ---
>
> and virtually all compilers store enum variables as signed integers,

I don't think this is true. Both GCC and Clang seem to pick an
unsigned one if possible (for the enum, not the constants), e.g.
https://godbolt.org/z/6zjzMdP3T. I assume bindgen is using the one
decided by clang.

Note that the quote of the standard is a constraint, i.e. the values
of the constants need to fit in an `int` (and the compiler is required
to issue a diagnostic if they don't, under `-Wpedantic` in GCC/Clang).

> As enums are naturally signed integers in the C world - can we somehow
> make bindgen default to c_int for all enum types?

This would be https://github.com/rust-lang/rust-bindgen/issues/1966,
where it has been suggested as an option (as well as the fact that the
constants are not being generated as `c_int`).

Cheers,
Miguel
