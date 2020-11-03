Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AA32A56DF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 22:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732850AbgKCVbg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 16:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732197AbgKCU53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 15:57:29 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DC5C0613D1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 12:57:27 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id t11so19851153edj.13
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 12:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4ZEoQ8z+KuO6UektX+PVRJibuJz+MVwqFQ1x1q8N6EU=;
        b=HfNXDPX3agrqXfGjK5f4jxumnyzVSNCsXg6eQqtoDKFesOQyqVPnHkZem1Ipg6GU0O
         v76MCfGjZfcZeANVNvFfekmSDMptmj4s+8vsI4+r/jniv+umQTKU8cV+4kDEHoptqIhM
         W90BBRm9Y8PMUay2NLjt0d2fv/O3wMpgfcHFEgj/AVB8xiM92lwMEYGxDdt9q4lLSXmX
         hK5Wt7a2pdGko7T/EwcChsBmbpzxupNniOFFHZzyV6FGNxDJ8szHsF1AeRvaY1WXpe4U
         TqO4hyWfMQIp/LMt2l+xrIEmXIxrinIlaA2xOSW+Dz8Z0uVvFTFMKOrCz1/2395XalWA
         YPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4ZEoQ8z+KuO6UektX+PVRJibuJz+MVwqFQ1x1q8N6EU=;
        b=qoapUEwfDUx8XweEhGzRo+KVGTE/6JFX8vmXvB7y/j+9/KFE8KBUuwjSV65SgxW/Up
         coIMotoMaWGpTsP1+DZcQp0I7cqE0/7ImBTKg6RhjXyYESvxPNdzv2WHjwSAi7Kn0HCu
         kcwm7Ylgg24hATuXyUJ7fJYwnp/njH0vmhsvFVr+FHQk41Tf2Zxb2hD8ICm775MrAS9K
         yGgkJAkjeudZk8pPvASKTu2AmZRCYoixZeOgXWL/PJfcskW/ivnmKRUEeeaLNOduZoCv
         hh2fLA1MnIGoL+IsyXmUt08jfC8dIDM3Y8iwZ1bFU7PiExkkypSizvXJvYed83G7+gqi
         u7pQ==
X-Gm-Message-State: AOAM530TO8rhWteoBu1Xaca2x4nMVkBAB2CtoHxz387YRo2Ymu9oJvYR
        htDNzfovV+mFkM4RLh9Bs3Mkgm9naySWeg==
X-Google-Smtp-Source: ABdhPJzmd63J29m3Th6fhJti/pO4Nrso1rJEOOzB1ASHPFnINScrza+wNUxdCMrhY9icSCKCLKgvyw==
X-Received: by 2002:aa7:df81:: with SMTP id b1mr15943911edy.365.1604437045761;
        Tue, 03 Nov 2020 12:57:25 -0800 (PST)
Received: from localhost.localdomain ([188.24.2.0])
        by smtp.gmail.com with ESMTPSA id y15sm30232eds.56.2020.11.03.12.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 12:57:25 -0800 (PST)
From:   Jack Winch <sunt.un.morcov@gmail.com>
Subject: Re: [libgpiod] C++ Bindings ABI Compatibility
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
References: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
 <CAMRc=MenVv0p2A7+E5z=5E8t50uh3vhhCWpg22oAfO0bEK1QJA@mail.gmail.com>
Message-ID: <c0f159a1-32d7-d5b5-7f08-c0cb482e4501@gmail.com>
Date:   Tue, 3 Nov 2020 21:01:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=MenVv0p2A7+E5z=5E8t50uh3vhhCWpg22oAfO0bEK1QJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for the delayed response.

    I've had some experience in enterprise C++ a couple years ago (high
    availability systems for a big corporation) and I've worked with some
    brilliant C++ developers and I believe it. It's due to the fact that
    such systems are usually packaged together and rebuilt from scratch.
    Add to it a strong "not-invented-here" syndrome and you can basically
    disregard any ABI issues.


That's exactly it.

    > 2.  Provide a C++ ABI, but  implement the PImpl pattern such that it is
    > possible to  maintain ABI compatibility for the major version releases
    > of the library  (implementation details may be changed to implement bug
    > fixes, etc, which  is not possible without using the PImpl pattern).
    > Even with this  approach, there are limitations as to what should be
    > passed over the  shared library - application boundary.
    >
    Could you elaborate on the last sentence? Since my gut is telling me
    PImpl would be the right choice, I'd like to know what these
    limitations are.


Sure.  The expansion of that comment is thus:

In order to reduce ABI compatibility problems in this scenario, do not 
pass anything over the boundary unless you can be certain that the ABI 
of those items are stable and compatible.  This should be taken to mean 
objects where ABI stability is guaranteed by the provider or you have 
control of the ABI stability yourself.  On some platforms and with some 
C++ standard library implementations, the exposure of standard library 
types in the public interface is out of the question, as ABI 
compatibility is not retained between major releases of the standard 
library implementation.  These are the 'pain points' for the Qt 
libraries on certain platforms and with certain compiler collections.

You also have to consider the binary compatibility of how certain 
language features are implemented by the dependency and reverse 
dependency.  For example, the manner in which exceptions are handled may 
differ between the dependency and reverse dependency.  This issue in 
particular is why Qt makes exclusive use of return codes (and not 
exceptions) for error handling.  Of course, the implementation of such 
features is determined by the compiler collection being used to build 
each binary module (as well as any settings applied during the build).

Fortunately, both libc++ and libstdc++ are relatively stable and 
somewhat compatible from an ABI point of view.  Both gcc and clang 
attempt to implement ABI stability and compatibility, with both 
implementing portions of the Itanium C++ ABI.  There are still some 
issues though, but with time these issues are being resolved in later 
releases of the compiler collections.

The detailed status of compatibility between other compiler collections 
for GNU / Linux is beyond me at current, though it would be safe to 
assume that ABI compatibility is not completely guaranteed.

    Thanks for taking the time to write this down, very helpful!


You're very welcome. Obviously this is a very high-level and general 
overview.

    As I mentioned above - I'm leaning towards PImpl. The reasons I see
    for that are: we don't expose any templates to the user and we don't
    need any polymorphism. We also seem to have a rather well defined
    scope for the library - I can't imagine huge changes happening after
    the v2.0 release. 


I agree that the scope of the library is well-defined and relatively 
limited.  As you also point out, templates and polymorphism are not 
utilised in the current form of the library and its public interface.  
Of course, it is possible that future features might come along within 
the gpio subsystem / libgpiod, where making use of these language 
features within the C++ binding might be desired. That being said, it's 
not like we're developing a library of highly generic components.  If 
required, we can make use of Qt as a reference for implementing 
polymorphic inheritance hierarchies and limited [dynamic] strong data 
type variation with the PImpl pattern. So PImpl is a very viable option 
for the C++ binding, should you want to retain it being a shared library.

    Header-only approach means every user includes everything and we still
    need to recompile every user to update the library even with minor
    changes. How do distros handle this anyway? Let's say boost gets a
    bugfix - do all reverse dependencies get a bugfix release?


That's how it usually works.  And that fact means that the reverse 
dependency can be confident as to whether a library bug fix is available 
at runtime, because it is compiled into the reverse dependency.  This 
differs from the shared library approach, as whether or not the bug fix 
is available will depend on which version of the shared library is 
available and which gets loaded and linked at runtime.

With a lot of C++ developers, there is a cultural element around 
steering away from these types of issues if possible (and not for bad 
reason either).  So that is, in my opinion, one of the contributing 
reasons as to why this approach is seen as acceptable / preferred by a 
lot of this community.  If you make a bug fix to the library, you have 
to build the library and deploy it to the target anyway. Personally, I'd 
rather build the reverse dependency with the bug fix 'baked in' and 
deploy that.

Don't forget that if you make an ABI breaking change to the public 
interface of a shared library, you have to do a re-build and 
re-deployment of the library and reverse dependencies anyway.  At least 
if you go down the header-only library route, you remove the pain of 
having to worry about ABI compatibility and stability entirely (while 
being able to make full use of the features offered by the language).

    I've been looking at what C++ shared libraries I have installed on my
    regular Debian 10 system and then also browsed their code a bit. It
    turns out that many of them also put the entire implementation in the
    header (libjsoncpp, libmpeg2encpp and several others) and they're
    still at relatively low ABI major versions of the shared object - so
    I'm wondering if that's really such an issue? Or do so few people
    realize this is a problem?


ABI compatibility for C++ libraries is certainly less of an issue on GNU 
/ Linux (as compared to other platforms), but it is still an issue.  
I've not had experience with either of the packages you've mentioned, so 
it's possible they have not made ABI breaking changes or they just don't 
care (maybe through ignorance).

I guess, like everything, it all comes down to what you're trying to 
achieve and what you really care about.  I've met individuals who didn't 
give a hoot about this particular issue, as the carnage it caused 
downstream "wasn't their problem" and they "still get paid at the end of 
the month".

If you need me to expand on anything above, then let me know.  
Personally, I'm still for a header-only approach, but if you still want 
the C++ binding to be available as a shared library, the PImpl pattern 
would also be well suited in this case.  In either case, implementing 
the required changes should not be too taxing.

On a somewhat related note, I did a build of the libgpiod master branch 
yesterday.  Could you just confirm what the version should be for the 
resultant libgpiodcxx.so?  The built library has a version of 1.1.1.

Jack
