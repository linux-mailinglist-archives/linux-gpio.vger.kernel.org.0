Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E734C222F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 04:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBXDQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 22:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBXDQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 22:16:58 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00997253BD4
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 19:16:29 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id w63so1224048ybe.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=gwcHn2rWFGLwhtN7hIprls0mTQLcPQLXBQ0itujYX5qZ+tD8/JQBS4qmijXae/E6jv
         STef6TbYyPZUISzKzlCZ0jGGiKl28ZhS3IZcECR3r8DwYReJB7wvZlqz4sLemiDOrENe
         t6xrd1OWV2gBclJNuaKxDxGxXoKxMlB/kbyLSsoY1nH2ygo3xKpSRptP0lkaomedtZmO
         wMMECBibJcGwDoI4i+Wf5SySj8608H91ujQ3thcWMzRpenU1AgJOfTWkp+z8tocZtDgV
         EW5eBfVG3uLpqAdXGiolix9QxDlS3kWsr8b8kqv4JnPmjrqRA6o2cMEMSSEeVE8CBk40
         1/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=XIgKXRYMJeh6M3Z8b7LReVOCqaVJO8JXsuT0/9XKYdqDUosyPT9YYL5r1wYDgMCn3S
         vJ5sgoKGaf4CY8iM9lWwCfMr3l8IsGNFWr8d1hQOymsyiM/USuktsaqgFZA5IxQTtwrZ
         gx4QkL8kiL7xXa12J35zQHIlExBaq6c9Lr6oNXdoHiXyqAXBzwdhrDGsRML+4g/octr2
         YCe9slkaBgkgI3pWhCfwlD4cz/Ef12BT+Tbbbv9G/Ul1UBtDXayLEP2AosW2f3XmLX5w
         4JV2EBlmvqCCklFFbSLshfvp9RvHTnqZKSOYIFw5qBaJSlvmpPM9axe7iS0MbOCXgVfY
         UO3A==
X-Gm-Message-State: AOAM5313TW16VWtSz6xH0JggWhUaSKw8BsZgA8Y9UA80G4frR8WUOb52
        jxvyBpaXUlG9jpujbLLY5cvdkPnRcE8Iz5t0jQU=
X-Google-Smtp-Source: ABdhPJxAgVfPqpBzr/gDkjoJ2PGO17fP60xJk+cZ74Ys4jf8QfpLzBJ9uIa7AbSfCYC3moxtOzqmDhECOW16WMJwz7I=
X-Received: by 2002:a25:d6c7:0:b0:623:312e:e8b4 with SMTP id
 n190-20020a25d6c7000000b00623312ee8b4mr693650ybg.462.1645672589137; Wed, 23
 Feb 2022 19:16:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:738a:b0:210:6fe6:62e1 with HTTP; Wed, 23 Feb 2022
 19:16:28 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <gracebanneth@gmail.com>
Date:   Wed, 23 Feb 2022 19:16:28 -0800
Message-ID: <CABo=7A0upOA-4NbGO0LnXAawP9_Y0f891XDSSMv-d-z7J4rKBg@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2f listed in]
        [list.dnswl.org]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.0599]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gracebanneth[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
