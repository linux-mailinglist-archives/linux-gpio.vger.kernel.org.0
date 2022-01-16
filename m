Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DC948FC48
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 12:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbiAPLTz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 06:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234856AbiAPLTy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 06:19:54 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC86C06161C
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 03:19:54 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id a8so15178670qvx.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dlmn2S3EI9CDldIlfu1tPwXSNwshKHAqPvTXHMrQOEE=;
        b=KkADJSCYoB+8GduGbupfZNPK0w6gQ2pJIcXQkt+PvuX/H6jF46p+KqOYe/uJxpFCHW
         RpJ2yOXPk1qpDRQjG2FOBxEVmrBwX+hs8w3BRfAI93O12ANu4eRV7I/cZhZgkBeWNT6H
         aPVQQ7+1gdABhfWLa6rq5EILNDwXcT1HDWaEJtvSWAZdWVIxna1OVb8jDvy4GdJWyOSu
         OiPXwqGIY8oNqH/pTc/caFGHA1KiTgxeNi8zrGUkteg2Dj+DqvUt1kWSQVOLf5SdGq++
         FEgQnJ84LuMzE6SrfWxLGAof3wmug0o9rkeShDMXXDuRTk+23Jv3GJ5WQJ+V0GfIbBwT
         N5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dlmn2S3EI9CDldIlfu1tPwXSNwshKHAqPvTXHMrQOEE=;
        b=qov4Mp38AMezMGV7NcmqoRVMg5M+MjqghKZ/DQY62EOaF71hfK3RaIippm9OrdoQaT
         e3ebEaIOPKP2FrUEENKR0UhrsuLoBFYhQUkTKwzNTBFYns+xwz/8PgjHyPd4tVPUREpB
         o2PF8fosRM78ux5NxivtaZC1EtzV+mMgJ3VKSBEXbEhU78LdSiSqKNGBfggCrkwC6lNw
         YNT885Z2ZFsORo+e1uWM282PXhF4v+3WTA7e10FodkDhJRheXDyMa3rl5/3zfcHlx6iV
         6o/HJj2QBB0KOO1Acoox1wvJW0jEdO6kATz8S2lMXGTBxj686z8uhi2ZZ4LgI6Vzsn29
         O73Q==
X-Gm-Message-State: AOAM531oVCtg/tb3cg2+I8EfXIRgeF1Yp7efRhtrgoLG0n1TKFq40ugY
        DwIt73+63SlkM4QgJBlA92p70CBVuw16bprpWmw=
X-Google-Smtp-Source: ABdhPJzUJl3BhP8bNc5BWD4ycbImkdieuB/uO7nMfqDNGjm71UYCx0dOTOQsNaNm6Lx5A2t54FgrBUD5n+rKCs4coUs=
X-Received: by 2002:a05:6214:da6:: with SMTP id h6mr5745598qvh.91.1642331993710;
 Sun, 16 Jan 2022 03:19:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:f5c1:0:0:0:0:0 with HTTP; Sun, 16 Jan 2022 03:19:53
 -0800 (PST)
From:   "ghinahala759@gmail.com" <eliseboutouli@gmail.com>
Date:   Sun, 16 Jan 2022 11:19:53 +0000
Message-ID: <CAA8orfTUjDGyZzEkyiaOeNPOH7XQqJWT9SRX2=FoVfFkQPQJuA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

44GT44KT44Gr44Gh44Gv44CB44GT44KT44Gr44Gh44Gv44CC44GC44Gq44Gf44Go5LiA57eS44Gr
44GE44KJ44KM44Gm44GG44KM44GX44GE44Gn44GZ44CC56eB44Gu5ZCN5YmN44Gv44Ku44OK44O7
44OP44Op44OT44Gn44GZ44CC56eB44Gv44Kk44K544Op44Ko44Or5Zu96Ziy6LuN44Go5Y2U5Yqb
44GX44Gm44GE44KL5b6T6LuN55yL6K235amm44Gn44GZ44CCDQrnp4Hjga7ogbfmpa3jgIHkurrn
qK7jgIHlm73nsY3jgpLmsJfjgavjgZfjgarjgYTjgafjgY/jgaDjgZXjgYTjgILnp4Hjga/jgYLj
garjgZ/jgajoqbHjgZflkIjjgYbjgZ/jgoHjgavpnZ7luLjjgavph43opoHjgarjgZPjgajjgpLm
jIHjgaPjgabjgYTjgb7jgZnjgIINCuWPi+aDheOBqOODkeODvOODiOODiuODvOOCt+ODg+ODl+OB
q+OBpOOBhOOBpuipseOBl+OBpuOCguOCieOBiOOBvuOBmeOBi++8n+engeOBq+apn+S8muOCkuS4
juOBiOOCi+OBk+OBqOOBjOOBp+OBjeOCi+OBi+OBqeOBhuOBi+OCj+OBi+OCiuOBvuOBm+OCk+OA
guacrOW9k+OBq+engeOBqOOBruiJr+WlveOBp+e5geaghOOBl+OBn+OCs+ODn+ODpeODi+OCseOD
vOOCt+ODp+ODs+OCkuOBl+OBn+OBhOOBruOBp+OBguOCjOOBsOOAgeS7peS4i+OBruengeOBruOD
oeODvOODq+OCouODieODrOOCueOAgWdoaW5haGFsYTc1OQ0KQCBnbWFpbC5jb23jgb7jgafjg6Hj
g7zjg6vjgZfjgabjgY/jgaDjgZXjgYTjgIINCg==
