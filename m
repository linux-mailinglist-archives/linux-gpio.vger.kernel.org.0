Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC09B77B5D0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 11:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjHNJ5Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 05:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbjHNJ5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 05:57:11 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0279EA3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 02:57:09 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-4871e54ee84so1533559e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692007028; x=1692611828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLqQQhrXZ5rGxvsYE9uGniUJNv/mJKUBzWSZyeEyVRI=;
        b=fYbNgUc/IFujfH7YoapMm0uIrb4G4onRnAOhAf1ncZ00TYhiKoRGhGVuxQlGmRfswr
         1tWuUhQnr3EHqtKGwQS1fyfFY2aBnRjTs4l044XjOHNjZdsSycwwTvZ3/5TU2gtseJZb
         Zit0+kXfw0FaK171hU2Ph3h1TtBQzEJWHijEWMyZN7MVt1xN7FJt1kECGiL3+/oN5h6d
         UEBRwh+3VllyFCEVS1rV0s43yHKpbxFWFvS7yGDhL813/YQ86q4Q63wyxAH0txXTxcn+
         JB6msCBFlGMXI96BpPZWQGD9NqwDUYBoYW7urOSdjWxYp0zMuee4etE7lTz0MDVyqKJN
         peUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007028; x=1692611828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLqQQhrXZ5rGxvsYE9uGniUJNv/mJKUBzWSZyeEyVRI=;
        b=IGqmnxltzXPG6WyyfbYjFrkH/T11f9JfhorF2VVvqzWecgyXKW5AHHR2rAs4XY6BN/
         Y0S8WfSyAxkv+qj6Es5cs+jlEtEjN5Kry5nt1ja4UehpDvBqCZCMtSzedoIARnLRJ8l8
         JkWh4qqzRE+UY5jSDKCdIZJBxjWK3J8TMjBMX4o2ZTqvD3HVhx6xs4vkWPaEOG1HqC/s
         H1FCZOBx0jJuzvvNvNYy6PHO3ql/gcB8Kd5iYhHYK6R8M4aHYGGr0LeaPacDLRGKyWMi
         XwZGjNX45GOJLJ+iZt08SHkqxp7OoppJO1rB4tM80eRJG1yYxtcMy8oexslt7Y7Ex0Oq
         4alA==
X-Gm-Message-State: AOJu0Yx5k5add36e3HCIEgpvDvTIRcNZtw1jKjBg1l18NPC8tFy2HAFO
        lApNPs2srXYsYJLHKopmtJJHnG8Njt2tllyTEBjABlfCRloimRppxKs=
X-Google-Smtp-Source: AGHT+IHijgvdegU764gUBaYlQBa5rNeCmeLQ7WbuMidOPzvlZME7IWEv2/px9NW3TJDfOyafqKBQ8I090P7SMbU0QfI=
X-Received: by 2002:a67:d011:0:b0:446:bf73:771a with SMTP id
 r17-20020a67d011000000b00446bf73771amr9075504vsi.20.1692007028073; Mon, 14
 Aug 2023 02:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <a6ce12acff7b4ed9bae1df0115bba1f3@schrack-seconet.com>
 <CAMRc=Mcc7M3wbGX+77pUkQFTiPtDx3vYkWp=8eJWMh6k4eqhhw@mail.gmail.com> <5e106aba54904302bef2bc743ea6959b@schrack-seconet.com>
In-Reply-To: <5e106aba54904302bef2bc743ea6959b@schrack-seconet.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Aug 2023 11:56:57 +0200
Message-ID: <CAMRc=MeHjQa0XVxM3xdZ0NbM_kNKFKLo+cB6PEudVEW9H0rrCw@mail.gmail.com>
Subject: Re: [libgpiod]: feature request: API functions, const correctness
To:     "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 10:16=E2=80=AFAM Hollerer Franz, Schrack Seconet AG=
,
Entwicklung <f.hollerer@schrack-seconet.com> wrote:
>
> Hi Bartosz!
>
> I hesitate to follow your reasoning. I personally highly appreciate const=
 correctness as it IMHO makes the intend of the code clearer, prevents misu=
se, and gives the compiler more options for warnings and optimization.
>
> Anyway, it's your choice and I respect this.
>
> Franz
>

If your object is:

struct foo {
    int foo;
    unsigned int bar;
};

And you know that after the call to do_stuff(), it will be the same,
then it's perfectly reasonable to go: void do_stuff(const struct foo
*f);.

But if all you have is:

struct foo;

And you have no idea what do_stuff() does internally, then (as the
author of the library) you're limiting yourself for the future if you
suddenly need to do: foo->counter++ in do_stuff().

In C++ this is fine - even if your method is marked as const, you can
have fields marked as mutable if they don't change the "logical
constness" of the object but in C it's better to just not use const
with opaque types.

Bart
