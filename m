Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25858534541
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 22:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbiEYUsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 16:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236178AbiEYUsY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 16:48:24 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA09B0D15
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 13:48:22 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id v26so9979081ybd.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+uyh4vUIYntN7Mid2B5fbgguOxBR2RiHnKBh7A4r37I=;
        b=MIznAoP29XHGMZwK2XaORcuFYY4KHU3SiD37YZr3IksbwEszYFwRGI6NMOaIsgw3Rc
         MNWUak9e2Pk5zm0JPp6szTBpWptBOFEsDKaXw1mzZOTFcRGcvyjOwqdtF8UB9EvyuuJZ
         fMICjT1+KZ7bxeE9NTTU8LESXRGeqFThSri55TjzyU4r+qSYB8KRkbeHsWYNf08X2bEy
         pryupL2ykuBV+sygnkk+fqajrVN1/45XJT6UIDBI/J4JIiO7GZW4kaISjbo9xtOnIbu3
         /lAT2wlHOnLDqj2MsvwscUqPgxRkbuhwflLse0VSR01xDxZYapbGb527uMRlqnyfWWDn
         3l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+uyh4vUIYntN7Mid2B5fbgguOxBR2RiHnKBh7A4r37I=;
        b=1cJbeJ4wqAbCL4bLW5/pYRuPg4Mhfx1L5xV+uWFVfquGfabb48abR2IfkuuM82Mg+1
         tBWWOYDDgvvs+45U0QGU9rpnRuLghBeZsqoKLfl2uD2LYR+rZq48KpsfmveewkKlIVbv
         uqphfnSszJlbJ5Z8FJzpxsGQOpOUbaNco41BprZtwzMtqUI0DD5f2tAnoQGkpY0NGKqu
         VBB8f/CvIixNoFvDLlvtD4+/uIM8+2jEGr9BEHnflndtu2jze+EHR2RyEzZ1b6alTNwL
         POgYChDD2YboyxZTuGloQlPPnVxpEpjO6dKtL68/o2rT7u7lJ3tWURXgg/0N4+jQd7eT
         4FmQ==
X-Gm-Message-State: AOAM532Vzl5XNPp7N1EiY9001ecB3AOtPUoJJ/qxs2aa029yxM+q69TS
        /eEqav/CgN3f4XooIV81FcWcm2yx8uLzRNGs1ro=
X-Google-Smtp-Source: ABdhPJygDnPWuNyLLxTk2B3Kv8LEKih1+m2wVtTUpsrNi1Bs8nM6GPylqvWzkD99kDlHZJJaie6GrPKCBIwCtXokpK8=
X-Received: by 2002:a05:6902:1023:b0:64f:39e7:ef05 with SMTP id
 x3-20020a056902102300b0064f39e7ef05mr31533397ybt.126.1653511701867; Wed, 25
 May 2022 13:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:3682:b0:17b:2b7b:c035 with HTTP; Wed, 25 May 2022
 13:48:21 -0700 (PDT)
From:   Colina Fernando <colinafernando724@gmail.com>
Date:   Wed, 25 May 2022 22:48:21 +0200
Message-ID: <CAP7Hh1-EL6tqrQsO0De_QJ1avJao_roXNeVStyzCoPtO9q14fg@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Fernando Colina

colinafernando724@gmail.com




----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Fernando Colina

colinafernando724@gmail.com
