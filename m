Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE4B54D593
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 01:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245457AbiFOX5a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 19:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242636AbiFOX53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 19:57:29 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371CEB4AA
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 16:57:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3137c877092so76379417b3.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 16:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=n758UHHHcDg0DF8tBD8FFbDj+Sx+Cf2wjf9XzB+ghbgdCVMwB7AvrblUCqN8OHDSjc
         r+PfoDqtkm0QKQejtXu1zDYl4tUXZ7SwvcuiecERtB/bKVGBQopcJwUHf5ebDv9Fz4tP
         +W3U7MqhzXLVdLE9zutzcXndGeGYVgO3T4WppjMggVt/QMJw0bdwiOdNS1U4q6HeaQWN
         Ip91LrcXaCwHSJSrQ0I5QNUn7VuHVBvPQWV4YZ/osdpkIyUbLX46Ao2g/xTg3KK4c8xu
         Ueh677vq25KpXb3hR2BVBXw684vtBX9OsbR27SFk7K4wE4BTuU/xHXtev76rZA8IDR9h
         5SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=0i+/nXMtxRs6XUurllsAfdufA+CInFjn878KuunmXxK/Rq6qQ1cNaV7D3XlOt/OaMP
         NgmKFt3o8jO58XJyn3p0+dJ8yOLLR1YFw6enxR4P/tH4dTjI+u+i1nXv692xTenZEcqK
         4Zs9onsChOHO3Y1E+BVU/kq3FHRiruVR3TdqM2UONcuLcJ37qbDBJ1YFd/cI7MG5XH9i
         6CcoYrip4OAt/Ra6APq/VtkZwB3L05vrnwppFCUngoSX5r0uu44w7IfmWQ9Cnca7BG1R
         73KrKN7gA+VnqqXaZP2jTObE+nVNB7rTAS6jsbzg+wx9b9A7xBLjVzMqvElkp+tzuQ6p
         Q2JA==
X-Gm-Message-State: AJIora9nzJ//wi1NIiariobMooCIbuVzjh0xXWTwELo1NB5cmK3t6VqV
        1+3ELn5lCMXNOpb6LuT8oJz1EFLULxwrGg8j7Po=
X-Google-Smtp-Source: AGRyM1sYCenJAO/LEj2cmH/Eogf2B+Osz1d3AAcgnV39HIJkusS2kyZDNClW1LuJnTpodeDEQoN3QCjpXx/1+LrsF5s=
X-Received: by 2002:a81:6ccd:0:b0:30c:3960:6db0 with SMTP id
 h196-20020a816ccd000000b0030c39606db0mr2542287ywc.410.1655337448236; Wed, 15
 Jun 2022 16:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:4245:b0:2d9:d74f:df2f with HTTP; Wed, 15 Jun 2022
 16:57:27 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <gracebanneth@gmail.com>
Date:   Wed, 15 Jun 2022 16:57:27 -0700
Message-ID: <CABo=7A0jVV_TbrHK5SYWuKLL_1WU=SqhkwD-oQjhss-EhZL5Xw@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
