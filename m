Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECFC33A896
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Mar 2021 23:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCNWhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Mar 2021 18:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCNWg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Mar 2021 18:36:59 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44D9C061762
        for <linux-gpio@vger.kernel.org>; Sun, 14 Mar 2021 15:36:59 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso4232508oti.11
        for <linux-gpio@vger.kernel.org>; Sun, 14 Mar 2021 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=Hk1EV1NsKXhhTA3EidUsb0LYhZ5KxBWm9k/rKVsf4zJLFKRMKkCbnu57wG/vz88TNG
         V9kNZov2FPb0XlSOeZ71dh5WUXynXGCB9WwOLzpdstF1TYxUOc4RtzQWfRNZgUiS18NN
         byh/O0efPKeZfOLpyek3MGYlx8QP6VSOh7qfq5aB4m21BMbDisv98ZjDjjRpruGKf09F
         lBrI3MTqJ0a+2kqwhLM78v/CKaeslz5z8Yrw4LrDOXTwr3pR8QdhQzydYl0e96K1sJi7
         re17lBvsHyHA3GPvsUkUgJReZTzIAKAjGU09F6MLqXvYAPKWZuCHjf2N84znMkTHB+i9
         RU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=PwbLv71X0IsKDEVHwbO5gepqFkI5gSDaT1HmJ4jPJKGB1x2yI8t2JEh87PzTkgfc5+
         sWK61CkUNUwqWaQTT7i7awFSPAlH8AKkUHty6YXnjzUCGJeTet65lhiZsY2UOax8Ag7k
         gEQFAzNSHtgu1XOiw+o3Uu2P4BDmc4mWeQT/h8Vm5ojbf5cTOw/HFovWCq/ABhDVzLTU
         X/+2gsaCXnYwu1UkcZLVcUFYatKk6vXdpfLjT7SeSFg3zNdy9jY68kI4E2n9MDOe/EQp
         q0q57PEVSuQlSNMK2bHKrUs1OOfRo8T49lS9/jYdQDxG50QAQSogzkmrW91C08vnX/GK
         pjPA==
X-Gm-Message-State: AOAM533NNni30WlvkZUSgsMX6K2ad3QREpEzWcsThlV/Z+sdgSgNFVlA
        HSKqc4OvycXe+IufAmbjxpfNYEgh0P9HI+RZy8Me/k+t1fMUNA==
X-Google-Smtp-Source: ABdhPJwx9JxXfmqqZS+5F5TjukdGHZ2LH5Bz33nUrMBkhXNUK8csea646d8LrVjkFdIjKmt6Bqo1fE+bEEztwC8+eOA=
X-Received: by 2002:a9d:4b9a:: with SMTP id k26mr11775888otf.326.1615761418955;
 Sun, 14 Mar 2021 15:36:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:61c8:0:0:0:0:0 with HTTP; Sun, 14 Mar 2021 15:36:58
 -0700 (PDT)
Reply-To: stephenbordeaux@yahoo.com
From:   Stephen Bordeaux <awereoufaya@gmail.com>
Date:   Sun, 14 Mar 2021 23:36:58 +0100
Message-ID: <CAOzKD-Oh1AqxH6yL0pVfm1ckr49igUM=Pnw2VPN60jBTt-uXCA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ich habe mich aufgrund der mit dieser Frage verbundenen Dringlichkeit
entschlossen, Sie zu kontaktieren. Ich bin Stephen Bordeaux,
Rechtsanwalt. Ich pers=C3=B6nlich bin ein Treuhandagent von Dr. Edwin,
einem weithin bekannten unabh=C3=A4ngigen Auftragnehmer hier in Lome Togo,
der mit seiner Frau und seiner einzigen Tochter bei einem Autounfall
ums Leben kam. Ich habe Sie kontaktiert, um mich bei der R=C3=BCckf=C3=BChr=
ung
des Fondsverm=C3=B6gens zu unterst=C3=BCtzen. Acht Millionen f=C3=BCnfhunde=
rttausend
Dollar auf Ihr Konto. Bitte kontaktieren Sie mich f=C3=BCr weitere
Informationen zu diesem Thema.
